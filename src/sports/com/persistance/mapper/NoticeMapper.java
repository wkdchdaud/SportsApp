package sports.com.persistance.mapper;

import java.util.List;
import config.Mapper;
import sports.com.dto.NoticeDTO;

@Mapper("NoticeMapper")
public interface NoticeMapper {

	List<NoticeDTO> getNoticeList() throws Exception;

	NoticeDTO InsertNoticeInfo(NoticeDTO nDTO) throws Exception;

	NoticeDTO getNoticeInfo(NoticeDTO nDTO) throws Exception;

	void updateNoticeReadCnt(NoticeDTO nDTO) throws Exception;

	void updateNoticeInfo(NoticeDTO nDTO) throws Exception;

	void deleteNoticeInfo(NoticeDTO nDTO) throws Exception;

}
