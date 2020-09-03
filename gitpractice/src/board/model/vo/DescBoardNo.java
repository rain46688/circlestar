package board.model.vo;

import java.util.Comparator;

public class DescBoardNo implements Comparator<Board> {

	@Override
	public int compare(Board o1, Board o2) {
		// TODO Auto-generated method stub
		if (o1.getBoardNo() < o2.getBoardNo())
			return -1;
		else if (o1.getBoardNo() == o2.getBoardNo())
			return 0;
		else
			return 1;
	}







}
