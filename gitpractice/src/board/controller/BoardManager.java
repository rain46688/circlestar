package board.controller;

import java.util.ArrayList;
<<<<<<< HEAD
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
=======
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;

import board.model.vo.Board;

public class BoardManager {
	
	Scanner sc=new Scanner(System.in);

	public void displayBoard(){
		System.out.println("조회하실 글 번호를 입력하세요");
		int searchNo=sc.nextInt();
		ArrayList<Board> boardList=new ArrayList<Board>();
		for(int i=0; i<boardList.size(); i++) {
			if(boardList.get(i).getBoardNo()==searchNo) {
				System.out.println(boardList.get(i).getBoardContent().toString());
			}
		}
		
	}
	
	public void deleteBoard(){
		System.out.println("삭제할 글 번호를 입력하세요");
		int deleteNo=sc.nextInt();
		ArrayList<Board> boardList=new ArrayList<Board>();
		for(int i=0; i<boardList.size(); i++) {
			if(boardList.get(i).getBoardNo()==deleteNo) {
				System.out.println(boardList.get(i).getBoardContent().toString());
			}
		}
		System.out.println("정말로 삭제하시겠습니까?(y/n)");
		if(sc.next()=="y" || sc.next()=="Y") {
			for(int i=0;i<boardList.size();i++) {
				if(boardList.get(i).getBoardNo()==deleteNo)
					boardList.remove(i);
					System.out.println(deleteNo+"번 글이 삭제되었습니다.");
			}
		}
		
>>>>>>> origin/inhee
	}
}
