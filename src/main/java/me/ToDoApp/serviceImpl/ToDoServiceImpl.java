package me.ToDoApp.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import me.ToDoApp.entity.ToDo;
import me.ToDoApp.repository.ToDoRepository;
import me.ToDoApp.service.ToDoService;

@Service
public class ToDoServiceImpl implements ToDoService{

	@Autowired
	private ToDoRepository todoRepo;
	
	@Override
	public List<ToDo> getAllTodoItems() {
		
		ArrayList<ToDo> todoList = new ArrayList<>();
		todoRepo.findAll().forEach(todo -> todoList.add(todo));
		return todoList;
	}

	@Override
	public ToDo getTodoItemById(Long id) {
		
		return todoRepo.findById(id).get();
	}

	@Override
	public boolean saveOrUpdateTodoItem(ToDo todo) {
		ToDo updatedItem = todoRepo.save(todo);
		
		if(getTodoItemById(updatedItem.getId()) != null) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateStatus(Long id) {
		ToDo todo = getTodoItemById(id);
		todo.setStatus("Completed");
		return saveOrUpdateTodoItem(todo);
	}

	@Override
	public boolean deleteTodoItem(Long id) {
		
		try {
			todoRepo.deleteById(id);
			return true;
		} catch(Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
		
	}

}
