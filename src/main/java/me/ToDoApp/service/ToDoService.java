package me.ToDoApp.service;

import java.util.List;

import me.ToDoApp.entity.ToDo;

public interface ToDoService {
	
	public List<ToDo> getAllTodoItems();
	
	public ToDo getTodoItemById(Long id);
	
	public boolean saveOrUpdateTodoItem(ToDo todo);
	
	public boolean updateStatus(Long id);
	
	public boolean deleteTodoItem(Long id);
}
