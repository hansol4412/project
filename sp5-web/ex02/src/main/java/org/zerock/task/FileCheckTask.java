package org.zerock.task;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.zerock.domain.BoardAttachVO;
import org.zerock.mapper.BoardAttachMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class FileCheckTask {
	@Setter(onMethod_= @Autowired)
	private BoardAttachMapper attachMapper;
	
	private String getFoldersYesterday() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1);
		String str = sdf.format(cal.getTime());
		return str.replace("-", File.separator);
	}
	
	@Scheduled(cron="0 0 18 * * *")
	public void checkFiles() throws Exception{
		log.warn("File check Task run...........");
		log.warn("==============================");
		
		//DB에서 어제 날짜로 보관되는 모든 첨부파일의 목록을 가져온다
		List<BoardAttachVO> fileList = attachMapper.getOldFiles();
		
		//DB 목록은 BoardAttachVO 객체여서 Path형식으로 변경한다.
		List<Path> fileListPaths = fileList.stream()
					.map(vo -> Paths.get("C:\\upload", vo.getUploadPath(), vo.getUuid() + "_" + vo.getFileName()))
					.collect(Collectors.toList());
		
		//이미지 파일이면 썸네일도 리스트에 추가한다
		fileList.stream().filter(vo-> vo.isFileType() ==true)
					.map(vo -> Paths.get("C:\\upload",vo.getUploadPath(), "s_" + vo.getUuid() + "_" + vo.getFileName()))
					.forEach(p-> fileListPaths.add(p));
		
		log.warn("=============================");
		
		File targetDir = Paths.get("C:\\upload", getFoldersYesterday()).toFile();
		
		//실제 폴더에 있는 파일 목록에서 데이터 베이스에 없는 파일들을 찾아서 목록으로 준비
		File[] removeFiles = targetDir.listFiles(file -> fileListPaths.contains(file.toPath())==false);
		
		//파일 삭제
		log.warn("-----------------------------");
		for (File file : removeFiles) {
			log.warn(file.getAbsoluteFile());
			file.delete();
		}	
	}
}
