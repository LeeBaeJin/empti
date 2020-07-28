package com.hein.empti.common;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.document.AbstractXlsView;

@Component("commonExcelView")
public class CommonExcelView extends AbstractXlsView {

	private static final Logger LOGGER = LoggerFactory.getLogger(CommonExcelView.class);

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		// 파일 네임 변경해주는 코드
		String file_name = (String) model.get("filename") + System.currentTimeMillis() + ".xlsx";
		response.setHeader("Content-Disposition", "attachment; filename=\"" + file_name + "\"");

		Cell cell = null;
		Sheet sheet = workbook.createSheet("User List");
		sheet.setDefaultColumnWidth(12);
		List<Map<String, Object>> list = (List<Map<String, Object>>) model.get("datas");
		Row row;

		// Header 출력
		int rowNum = 0;
		String[] headers = (String[]) model.get("headers");
		if (headers != null) {
			row = sheet.createRow(rowNum++);
			int colNum = 0;
			for (String header : headers) {
				row.createCell(colNum++).setCellValue(header);
			}
		}

		if (headers != null) {
			for (int i = 0; i < list.size(); i++) {
				row = sheet.createRow(i);
				Map map = list.get(i);
				int j = 0;
				for (String header : headers) {
					cell = row.createCell(j++);
					cell.setCellValue( map.get(header).toString() );
				}
			}
		} else {
			for (int i = 0; i < list.size(); i++) {
				row = sheet.createRow(i);
				Map map = list.get(i);
				Iterator<String> iter = map.keySet().iterator();
				int j = 0;
				while (iter.hasNext()) {
					cell = (HSSFCell) row.createCell(j++);
					cell.setCellValue(map.get(iter.next()).toString());
				}
			}
		}
	}
}