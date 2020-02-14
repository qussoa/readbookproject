package com.biz.rbooks.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

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
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Slf4j
@Controller
public class BookController {

	private final BookService bService;
	private final ReadService rService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String search(Model model,
			@RequestParam(value = "b_name", required = false, defaultValue = "") String b_name) {

		log.debug("LIST");

		List<BookDTO> bList = new ArrayList<BookDTO>();

		if (b_name == "") {
			bList = bService.selectAll();
		} else {
			bList = bService.selectNameSearch(b_name);
		}

		model.addAttribute("BOOKLIST", bList);

		log.debug(bList.toString());

		return "list";
	}

	@RequestMapping(value = "/view/{b_code}", method = RequestMethod.GET)
	public String view(@PathVariable("b_code") String b_code, Model model) {

		BookDTO bookDTO = bService.findByCode(b_code);

		model.addAttribute("bookDTO", bookDTO);

		return "view";
	}

	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insert(@ModelAttribute("bookDTO") BookDTO bookDTO, Model model) {

		model.addAttribute("bookDTO", bookDTO);
		return "insert";
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(@ModelAttribute("bookDTO") BookDTO bookDTO) {
		log.debug(bookDTO.toString());
		bService.insert(bookDTO);
		return "redirect:/list";
	}

	@RequestMapping(value = "/update/{b_code}", method = RequestMethod.GET)
	public String update(@PathVariable("b_code") String b_code, Model model) {
		BookDTO bookDTO = bService.findByCode(b_code);
		model.addAttribute("bookDTO", bookDTO);
		return "insert";
	}

	@RequestMapping(value = "/update/{b_code}", method = RequestMethod.POST)
	public String update(@PathVariable("b_code") String b_code, BookDTO bookDTO) {

		bService.update(bookDTO);
		return "redirect:/view/{b_code}";
	}

	@RequestMapping(value = "/delete/{b_code}", method = RequestMethod.GET)
	public String delete(@PathVariable("b_code") String b_code) {

		bService.delete(b_code);
		return "redirect:/list";

	}
}
