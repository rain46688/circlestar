package board.controller;

import java.util.ArrayList;
import java.util.Scanner;

import board.model.vo.Board;

public class BoardManager {
	private ArrayList<Board> list = new ArrayList<Board>();

	public void displayAllList() {

		if (list.isEmpty()) {
			System.out.println("게시판이 비었다.");
		} else {
			for (Board b : list) {
				System.out.println(b);
			}
		}
	}

	public void modifyContent() {
		Scanner sc = new Scanner(System.in);

		System.out.println("수정할 글 번호: ");
		int num=sc.nextInt();
		System.out.println("수정할 내용 : ");
		String newContent=sc.nextLine();
		for(int i=0; i<list.size();i++) {
			if(list.get(i).getBoardNo()==num) {
				list.get(i).setBoardContent(newContent);
				
			}
		}
//		list를 for문으로 돌면서 방금 입력받은 수정글 번호랑 list에 들어있는 번호와 일치하면 수정을 해서 if문.
//		if문 안에서 변경할 내용을 받아야함. System.out.println();
//		exit를 입력받게 되면 무한루프를 빠져나가야함. 
	
		

	}
}
