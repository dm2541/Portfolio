package com.LCY.myapp.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.LCY.myapp.model.dto.Comment;
import com.LCY.myapp.model.dto.CriteriaVO;

public interface CommentMapper {
	public List<Comment> searchCommentByCafe(@Param("cirteriaVO") CriteriaVO cri, @Param("cafe_code") String cafe_code);
	public void commentDelete(int cnum);
	public void commentInsert(Comment comment);
	public int getCommentCount(String cafe_code);
}
