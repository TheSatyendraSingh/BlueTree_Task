package com.task.java.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.task.java.entity.Employee;
import com.task.java.service.EmpServiceInterface;

@Controller
public class MainController 
{
	@Autowired
	private EmpServiceInterface emp;
	public String msg = "";
	
	@GetMapping("/")
	public String getEmp(Model model) {
		List<Employee> list = this.emp.getAll();
		model.addAttribute("name", "EmployeeManagement");
		model.addAttribute("employees", list);
		model.addAttribute("msg", msg);
		return "index-page";
	}
	
	@RequestMapping("/add")
	public String add(Model model) {
		model.addAttribute("name", "EmployeeManagement");
		return "add-emp";
	}
	
	@PostMapping("/register")
	public String addEmp(Employee employee) {
		this.emp.addEmployee(employee); 
		msg = "Employee added Successfully...";
		return "redirect:/";
	}
	
	@GetMapping("delete/{id}")
	public String deleteEmp(@PathVariable int id) {
		//System.out.println(id);
		this.emp.dltEmp(id);
		msg = "Data deleted Successfully!!!";
		return "redirect:/";
	}
	
	@RequestMapping("/edit/{id}")
	public String edit(@PathVariable int id, Model model) {
		Employee emp = this.emp.getById(id);
		model.addAttribute("name", "EmployeeManagement");
		model.addAttribute("employee", emp);
		return "edit-page";
	}
	
	@PostMapping("/editEmp/{id}")
	public String editEmp(@PathVariable int id, Employee employee) {
		this.emp.addEmployee(employee); 
		msg = "Data modified Successfully...";
		return "redirect:/";
	}
}
