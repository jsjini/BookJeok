package com.yedam.data;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class DataInfoList {
	
	public ArrayList<DataVO> getBookData() {
		ArrayList<DataVO> lists = new ArrayList<DataVO>();
		
		// 인증키(ttbkey)
		String key = "ttbgydms10201631001";
		
		// 검색할 책 단어
		String keyword = "소설";
						
		// 파싱할 데이터 저장할 변수
		String result = "";
		try {
			URL url = new URL("http://www.aladin.co.kr/ttb/api/ItemSearch.aspx?ttbkey=" + key + 
									  "&Query=" + keyword +  "&QueryType=Title&MaxResults=50&start=1&output=js&Version=20131101");
					
			BufferedReader bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			
			result = bf.readLine();
			
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject) jsonParser.parse(result);
			JSONArray item = (JSONArray) jsonObject.get("item");
			
			
			DataVO vo = new DataVO();
					
			for(int i=0;i<item.size();i++) {
				//System.out.println(item.get(i));
				JSONObject  book = 	(JSONObject)item.get(i);
				vo.setAuthor((String)book.get("author"));
				vo.setName((String)book.get("title"));
				vo.setIsbn((String)book.get("isbn13"));
				vo.setComp((String)book.get("publisher"));
				vo.setPrice(Integer.parseInt(String.valueOf(book.get("priceStandard"))));
				
				lists.add(vo);
			}
			
			System.out.println(lists);
			// System.out.println(lists.get(0));
		} catch (Exception e) {
			e.fillInStackTrace();
		}
		return lists;
	}
}
