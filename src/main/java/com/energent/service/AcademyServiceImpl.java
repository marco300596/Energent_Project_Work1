package com.energent.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.energent.entity.Academy;
import com.energent.repository.AcademyRepository;

import ch.qos.logback.classic.joran.action.LoggerContextListenerAction;

@Service
public class AcademyServiceImpl implements AcademyService {

	@Autowired
	AcademyRepository academyRepository;
	
	@Override
	public Academy findAcademybyId(String codeId) {
		Academy academy = null;
		if (academyRepository.existsById(codeId)) 
			academy = academyRepository.findById(codeId).get();
		return academy;
	}
	
	/*
	 * this method is used to see if the selected pair of dates can be used fon an academy
	 */
	public int rightDate(String start, String end) {
		
		int result = 2;
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy"); // used to inform the parsing function of the pattern used
		LocalDate startDate = LocalDate.parse(start, formatter); // used to parse
		startDate.minusMonths(1);
		LocalDate endDate = LocalDate.parse(end, formatter);
		endDate.minusMonths(1);
		if(startDate.isBefore(endDate)) {
			
			result = 1;
			String systemDate = LocalDate.now().format(formatter); //initialize a string with the value of the actual date
			if (startDate.isAfter(LocalDate.parse(systemDate, formatter)) || startDate.isEqual(LocalDate.parse(systemDate, formatter))) { // comparison between system's and starting date
				
				result = 0;
				return result;
			}

			return result;
		}
		return result;
	}
	
	@Override
	public boolean matchingDate(String givenString) {
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		LocalDate actualDate = LocalDate.now();	//actual date of the system
		actualDate.minusMonths(1);
		LocalDate minexpectedDate=actualDate.minusYears(1);
		LocalDate givenDate = LocalDate.parse(givenString, formatter);
		return ((givenDate.isAfter(minexpectedDate)) && (givenDate.isBefore(actualDate)) && (givenDate.isEqual(actualDate)) && (givenDate.isEqual(minexpectedDate)));
	}
	
	public List<Academy> findAllAcademiesByYear(String year){
		
		List<Academy> academies = new ArrayList<>();
		List<Academy> academies1 = academyRepository.findAll();
		for(Academy academy : academies1)
			if (matchingDate(academy.getStartDate()))
				academies.add(academy);
		return academies;
	}
	
	@Override
	public int addAcademy(Academy academy) {
		
		int result = 1;
		if (!academyRepository.existsById(academy.getCodeId())) { // control to see if exists an academy with the inserted code
			if(rightDate(academy.getStartDate(), academy.getEndDate()) == 0) { // control if the dates can be used
			
				academyRepository.save(academy);
				result = 0;
				return result;
			}else {
				
				result = 2;
				return result;
			}
		}
		
		return result;
		
	}
	
	@Override
	public boolean updateAcademy(Academy academy) {
	
		boolean res=false;
		if(rightDate(academy.getStartDate(), academy.getEndDate()) == 0){ // see if the dates can be used
			res = true;
			/*
			Academy academyToUpdate = findAcademybyId(academy.getCodeId());
			academyToUpdate.setCodeId(academy.getCodeId());
			academyToUpdate.setTitle(academy.getTitle());
			academyToUpdate.setLocation(academy.getLocation());
			academyToUpdate.setStartDate(academy.getStartDate());
			academyToUpdate.setEndDate(academy.getEndDate());
			academyToUpdate.setStudents(academy.getStudents());
			*/
			academyRepository.save(academy);
			return res;
		}
		
		return res;
	}

	@Override
	public void removeAcademy(String codeId) {

		academyRepository.deleteById(codeId);
	}
	
	@Override
	public List<Academy> findAllAcademies(){
		
		return academyRepository.findAll();
	}

	@Override
	public List<Academy> findAcademiesByTitle(String title) {
		
		return academyRepository.findByTitle(title);
	}

	@Override
	public List<Academy> findAcademiesByLocation(String location) {
		
		return academyRepository.findByLocation(location);
	}

	@Override
	public List<Academy> findAcademiesByStartDate(String startDate) {
		
		return academyRepository.findByStartDate(startDate);
	}

	@Override
	public List<Academy> findAcademiesByEndDate(String endDate) {
		
		return academyRepository.findByEndDate(endDate);
	}
	
	@Override
	public List<Academy> findAcademiesByStartAndEndDate(String startDate, String endDate) {
		
		List<Academy> resultAcademies = new ArrayList<>();
		List<Academy> academies = findAllAcademies();
		for (Academy academy : academies) {
			if ((rightDate(academy.getEndDate(), endDate)==1) && (rightDate(startDate, academy.getStartDate())==1)) {
				resultAcademies.add(academy);
			}
		}
		return resultAcademies;
	}

}
