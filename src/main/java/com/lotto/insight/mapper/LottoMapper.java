package com.lotto.insight.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.lotto.insight.dto.LottoResultDto;

@Mapper
public interface LottoMapper {
    LottoResultDto getLottoResultByRound(int round);
    List<LottoResultDto> getRecentLottoResults();
    List<Integer> getAllNumbers();
    void insertLottoResult(LottoResultDto result);
    void updateLottoResult(LottoResultDto result);
    void deleteLottoResult(int round);
}