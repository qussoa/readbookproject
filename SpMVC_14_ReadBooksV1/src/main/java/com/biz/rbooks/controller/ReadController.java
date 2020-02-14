package com.biz.rbooks.controller;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.biz.rbooks.domain.BookDTO;
import com.biz.rbooks.domain.ReadBookDTO;
import com.biz.rbooks.service.BookService;
import com.biz.rbooks.service.ReadService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class ReadController {

	private final ReadService rService;
	private final BookService bService;

	@RequestMapping(value = "/rblist", method = RequestMethod.GET)
	public String list(Model model) {
		List<ReadBookDTO> readList = rService.selectAll();
		model.addAttribute("READLIST", readList);
		return "rbook/rblist";
	}

	@RequestMapping(value = "/rbview/{rb_seq}", method = RequestMethod.GET)
	public String view(@PathVariable("rb_seq") long rb_seq, Model model) {
		List<ReadBookDTO> readList = rService.selectAll();

		ReadBookDTO rbookDTO = rService.findBySeq(rb_seq);
		model.addAttribute("READLIST", readList);
		model.addAttribute("readBookDTO", rbookDTO);

		return "rbook/rbview";
	}

	@RequestMapping(value = "/rbinsert/{rb_bcode}", method = RequestMethod.GET)
	public String insert(@PathVariable("rb_bcode") String rb_bcode, @ModelAttribute ReadBookDTO readBookDTO,
			Model model) {

		String b_code = readBookDTO.getRb_bcode();
		BookDTO bookDTO = bService.findByCode(b_code);

		LocalDate localDate = LocalDate.now();
		String curDate = localDate.toString();

		DateTimeFormatter dt = DateTimeFormatter.ofPattern("HH:mm:ss");
		LocalTime localTime = LocalTime.now();
		String curTime = localTime.format(dt);

		readBookDTO.setRb_date(curDate);
		readBookDTO.setRb_stime(curTime);
		readBookDTO.setRb_bcode(b_code);
		model.addAttribute("readBookDTO", readBookDTO);

		return "rbook/rbinsert";
	}

	@RequestMapping(value = "/rbinsert/{rb_bcode}", method = RequestMethod.POST)
	public String insert(@PathVariable("rb_bcode") String rb_bcode,
			@ModelAttribute("readBookDTO") ReadBookDTO readBookDTO) {
		rService.insert(readBookDTO);
		return "redirect:/rblist";
	}

	@RequestMapping(value = "/rbupdate/{rb_seq}", method = RequestMethod.GET)
	public String update(@PathVariable("rb_seq") long rb_seq, Model model) {
		ReadBookDTO readBookDTO = rService.findBySeq(rb_seq);
		model.addAttribute("readBookDTO", readBookDTO);
		return "rbook/rbinsert";
	}

	@RequestMapping(value = "/rbupdate", method = RequestMethod.POST)
	public String update(@ModelAttribute ReadBookDTO readBookDTO, Model model) {
		int ret = rService.update(readBookDTO);
		return "redirect:/rblist";
	}

	@RequestMapping(value = "/rbdelete/{rb_seq}", method = RequestMethod.GET)
	public String delete(@PathVariable("rb_seq") long rb_seq) {
		int ret = rService.delete(rb_seq);
		return "redirect:/rblist";
	}
}
