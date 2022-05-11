package com.energent.service;

import java.util.List;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.energent.entity.Academy;
import com.energent.entity.Student;
import com.energent.repository.AcademyRepository;
import com.energent.repository.StudentRepository;
@Service
public class StudentServiceImpl implements StudentService {
	
	Logger log = Logger.getLogger(this.getClass());

	@Autowired
	StudentRepository studentRepository;
	@Autowired
	AcademyRepository academyRepository;
	
	@Override
	public boolean addStudent(Student student, String id) {
		
		boolean result = false;
		Academy academy = academyRepository.findById(id).get();
		if (!studentRepository.existsById(student.getfCode())) {
			student.setAcademy(academy);
			studentRepository.save(student);
			result = true;
			return result;
		}
		return result;
	}
	
	public void UpdateStudent(Student student, Academy academy) {
	
	Student studentToUpdate = studentRepository.findById(student.getfCode()).get();
	studentToUpdate.setfCode(student.getfCode());
	studentToUpdate.setFirstname(student.getFirstname());
	studentToUpdate.setLastname(student.getLastname());
	studentToUpdate.setAge(student.getAge());
	studentToUpdate.setAcademy(academy);
	studentRepository.save(studentToUpdate);
  
	
}
	
	@Override
	public void removeStudent(String fCode) {

		studentRepository.deleteById(fCode);
	}

	@Override
	public List<Student> findStudentsByAcademy(Academy academy) {
		
		List<Student> students = studentRepository.findByAcademy(academy);		
		return  students;
		
	}

	@Override
	public List<Student> findStudentsByFirstnameAndLastname(String firstname, String lastname) {
		// TODO Auto-generated method stub
		return studentRepository.findByFirstnameAndLastname(firstname, lastname);
	}
	
	@Override
	public Student findStudentById(String fCode) {
		
		return studentRepository.findById(fCode).get();
	}
}
