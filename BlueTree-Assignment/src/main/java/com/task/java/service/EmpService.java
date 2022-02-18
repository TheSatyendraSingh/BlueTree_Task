package com.task.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.task.java.entity.Employee;
import com.task.java.repository.EmpRepo;

@Service
public class EmpService implements EmpServiceInterface {

	@Autowired
	private EmpRepo emprepo;
	@Autowired
	private Employee emp;
	
	@Override
	public List<Employee> getAll() {
		return this.emprepo.findAll();
	}

	@Override
	public void addEmployee(Employee employee) {
		this.emprepo.save(employee);
		
	}

	@Override
	public void dltEmp(int id) {
		emp = this.emprepo.getById(id);
		System.out.println(emp);
		this.emprepo.delete(emp);
	}

	public Employee getById(int id) {
		return this.emprepo.getById(id);
	}

}
