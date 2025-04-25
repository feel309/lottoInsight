package com.lotto.insight.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lotto.insight.dto.LottoResultDto;
import com.lotto.insight.mapper.LottoMapper;

@Service
public class LottoService {

    @Autowired
    private LottoMapper mapper;

    public LottoResultDto getResult(int round) {
        return mapper.getLottoResultByRound(round);
    }

    public List<LottoResultDto> getRecentResults() {
        return mapper.getRecentLottoResults();
    }

    public Map<Integer, Long> getFrequencyStats() {
        List<Integer> allNumbers = mapper.getAllNumbers();
        return allNumbers.stream().collect(Collectors.groupingBy(n -> n, Collectors.counting()));
    }

    public List<Integer> getMostFrequentNumbers(int limit) {
        return getFrequencyStats().entrySet().stream()
                .sorted(Map.Entry.<Integer, Long>comparingByValue().reversed())
                .limit(limit).map(Map.Entry::getKey).collect(Collectors.toList());
    }

    public List<Integer> getLeastFrequentNumbers(int limit) {
        return getFrequencyStats().entrySet().stream()
                .sorted(Map.Entry.comparingByValue())
                .limit(limit).map(Map.Entry::getKey).collect(Collectors.toList());
    }

    public List<Integer> getRandomSuggestion() {
        List<Integer> numbers = new ArrayList<>();
        Random rand = new Random();
        while (numbers.size() < 6) {
            int num = rand.nextInt(45) + 1;
            if (!numbers.contains(num)) numbers.add(num);
        }
        return numbers;
    }

    public List<Integer> getStatBasedSuggestion() {
        return getMostFrequentNumbers(6);
    }

    public void registerLottoResult(LottoResultDto result) {
        mapper.insertLottoResult(result);
    }

    public void updateLottoResult(LottoResultDto result) {
        mapper.updateLottoResult(result);
    }

    public void deleteLottoResult(int round) {
        mapper.deleteLottoResult(round);
    }
}