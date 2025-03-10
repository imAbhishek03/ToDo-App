package me.ToDoApp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import me.ToDoApp.entity.ToDo;

@Repository
public interface ToDoRepository extends JpaRepository<ToDo, Long>{

}
