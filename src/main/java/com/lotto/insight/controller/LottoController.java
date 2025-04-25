package com.lotto.insight.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lotto.insight.dto.LottoResultDto;
import com.lotto.insight.service.LottoService;

@Controller
public class LottoController {

    @Autowired
    private LottoService service;

//    @GetMapping("/lotto")
    @GetMapping("/")
    public String list(Model model) {
        model.addAttribute("results", service.getRecentResults());
        return "lottoList";
    }

    @GetMapping("/{round}")
    public String detail(@PathVariable int round, Model model) {
        model.addAttribute("result", service.getResult(round));
        return "lottoDetail";
    }

    @GetMapping("/stats")
    public String stats(Model model) {
        model.addAttribute("most", service.getMostFrequentNumbers(6));
        model.addAttribute("least", service.getLeastFrequentNumbers(6));
        return "stat";
    }

    @GetMapping("/suggest/random")
    @ResponseBody
    public List<Integer> suggestRandom() {
        return service.getRandomSuggestion();
    }

    @GetMapping("/suggest/stat")
    @ResponseBody
    public List<Integer> suggestStat() {
        return service.getStatBasedSuggestion();
    }

    @GetMapping("/admin")
    public String adminPage() {
        return "admin";
    }
    
    @PostMapping("/admin/add")
    @ResponseBody
    public String add(@RequestBody LottoResultDto dto) {
        service.registerLottoResult(dto);
        return "ok";
    }

    @PutMapping("/admin/update")
    @ResponseBody
    public String update(@RequestBody LottoResultDto dto) {
        service.updateLottoResult(dto);
        return "updated";
    }

    @DeleteMapping("/admin/delete/{round}")
    @ResponseBody
    public String delete(@PathVariable int round) {
        service.deleteLottoResult(round);
        return "deleted";
    }
}