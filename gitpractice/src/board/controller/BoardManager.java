package board.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import board.model.vo.Board;

public class BoardManager {
	ArrayList<Board> list = new ArrayList<Board>();
	Scanner sc = new Scanner(System.in);
	
	public void writeBoard() {
		System.out.println("새 게시글 쓰기 입니다");
		System.out.print("글제목 : ");
		String title = sc.nextLine();
		System.out.print("작성자 : ");
		String author = sc.nextLine();
		System.out.print("글내용 : ");
		String content = sc.nextLine();
		list.add(new Board(title, author, content));
	}
	
	public void modifyTitle() { //게시글 제목 수정	
		System.out.println("수정할 글 번호 :");
		int num=sc.nextInt();
		System.out.println("수정할 제목 : ");
		String newtitle =sc.nextLine();
		for(int i=0;i<list.size();i++) {
			if(list.get(i).getBoardNo()==num){
				list.get(i).setBoardTitle(newtitle);
			}
			
		}
	}
	
	public void searchBoard() { //게시글 검색
		System.out.println("검색할 제목 : ");
		String boardTitle=sc.nextLine(); //검색할 글자를 입력받음
		ArrayList<Board> list = new ArrayList<Board>();
		for(int i=0;i<list.size();i++) {
			if(list.get(i).getBoardTitle().contains(boardTitle)) {
				System.out.println(list);
			}
		}
		
//		for(Object b : list) {
//		if(b instanceof list ) {
//		}
//		}
		

		
		//ArrayList<Board> boardTitle= searchBoard(title);
		//if(searchTitle.isEmpty()) {
	//		System.out.println("검색한 게시글이 없습니다.");
	//	}else {
	//		for(Board b : searchTitle) {
	//			System.out.println(b);
		
	}
		// boardNo boardDate boardTitle(제목순 >) 
	
	public void sortList(int item,boolean isDesc) {
	System.out.print("정렬할 기준을 선택하세요 : (1:번호순 , 2: 날짜순, 3: 제목순");	
	item=sc.nextInt();
	System.out.print("true / false (true : 내림차순, false : 오름차순)");
	isDesc=sc.nextBoolean();
		if(item==1 && isDesc == true) {
			
		}else if(item==1 && isDesc ==false) {
			
		}else if(item==2 && isDesc == true) {
			
		}else if(item==2 && isDesc == true) {
		
		}else if(item==3 && isDesc == true) {
			
		}else if(item==3 && isDesc == true) {
			
		}
	
}
}
