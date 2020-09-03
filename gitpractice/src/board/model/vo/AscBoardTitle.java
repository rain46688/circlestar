package board.model.vo;

import java.util.Comparator;

public class AscBoardTitle implements Comparator<Board>  {

	@Override
	public int compare(Board o1, Board o2) {
		// TODO Auto-generated method stub
		String str1=o1.getBoardTitle();
		String str2=o2.getBoardTitle();
		
		return str1.compareTo(str2);
	}



	
}
