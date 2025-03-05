package me.ToDoApp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import me.ToDoApp.entity.ToDo;
import me.ToDoApp.service.ToDoService;

@Controller
public class ToDoController {

	@Autowired
	private ToDoService todoService;

	// View all todo items Page
	@GetMapping("/view-todo")
	public String viewAllTodoItems(Model model, @ModelAttribute("message") String message) {

		model.addAttribute("list", todoService.getAllTodoItems()); // adding todo items to model
		model.addAttribute("message", message); // adding redirect message to model
		return "ViewTodoItems"; // open view page -> ViewTodoItems.jsp
	}
	
	

	// view add todo item page
	@GetMapping("/add-todo")
	public String addTodoItem(Model model) {
		model.addAttribute("todo", new ToDo());
		return "AddTodoItem"; // open view page -> AddTodoItem.jsp
	}

	// save add todo item
	@PostMapping("/save-todo")
	public String saveTodoItem(ToDo todo, RedirectAttributes redirectAttributes) {
		if (todoService.saveOrUpdateTodoItem(todo)) {
			redirectAttributes.addAttribute("message", "Successfully Saved");
			return "redirect:/view-todo";
		}
		redirectAttributes.addAttribute("message", "Save Failed");
		return "redirect:/add-todo";
	}

	@GetMapping("/update-todo-status/{id}")
	public String updateTodoStatus(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {

		if (todoService.updateStatus(id)) { // check status updated or not
			redirectAttributes.addFlashAttribute("message", "Successfully Updated");
			return "redirect:/view-todo"; // redirect to ViewTodoList.jsp
		}
		redirectAttributes.addFlashAttribute("message", "Update Failed");
		return "redirect:/view-todo"; // redirect to ViewTodoList.jsp
	}

	// view edit todo item page
	@GetMapping("/edit-todo/{id}")
	public String editTodoItem(@PathVariable("id") Long id, Model model) {
		model.addAttribute("todo", todoService.getTodoItemById(id));
		return "EditTodoItem"; // open view page -> EditTodoItem.jsp
	}

	@PostMapping("/edit-save-todo")
	public String editSaveTodoItem(ToDo todo, RedirectAttributes redirectAttributes) {

		if (todoService.saveOrUpdateTodoItem(todo)) {
			redirectAttributes.addAttribute("message", "Successfully Updated");
			return "redirect:/view-todo";
		}

		redirectAttributes.addAttribute("message", "Update Failed");
		return "redirect:/edit-todo/" + todo.getId();
	}

	@GetMapping("/delete-todo/{id}")
	public String deleteTodoItem(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {

		if (todoService.deleteTodoItem(id)) {
			redirectAttributes.addAttribute("message", "Successfully Deleted");
		} else
			redirectAttributes.addAttribute("message", "Delete Failed");

		return "redirect:/view-todo";
	}
}
