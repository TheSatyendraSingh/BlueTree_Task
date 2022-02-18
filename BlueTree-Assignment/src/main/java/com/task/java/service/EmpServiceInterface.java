package com.task.java.service;

import java.util.List;

import com.task.java.entity.Employee;

public interface EmpServiceInterface {

	List<Employee> getAll();

	void addEmployee(Employee employee);

	void dltEmp(int id);

	Employee getById(int id);

}
