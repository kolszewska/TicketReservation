package com.olszewska.ticket.reservation.controller;

import com.olszewska.ticket.reservation.model.Reservation;
import com.olszewska.ticket.reservation.model.Show;
import com.olszewska.ticket.reservation.repository.ReservationRepository;
import com.olszewska.ticket.reservation.repository.ShowRepository;
import com.olszewska.ticket.reservation.service.ShowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.text.ParseException;
import java.util.List;

@Controller
public class AppController {

    @Qualifier("showRepository")
    @Autowired
    ShowRepository showRepository;

    @Qualifier("reservationRepository")
    @Autowired
    ReservationRepository reservationRepository;

    @Autowired
    ShowService showService;

    @RequestMapping(value = "/moviesList")
    public String shopListPage(Model model) throws ParseException {
        // java.util.Date date= new java.util.Date();
        List<Show> showList = showService.findAllShows();
        model.addAttribute("showList", showList);
        return "moviesList";
    }

    @RequestMapping(value = "reservation/show/{showId}")
    public String reservation(@PathVariable(value="showId") int showId, Model model) throws ParseException {
        Show show = showService.findById(showId);
        model.addAttribute("show",show);
        return "reservation";
    }

    @RequestMapping(value = "/addReservation/{id}", method = RequestMethod.POST)
    public String addReservation(@PathVariable(value="id") int id, Model model, Reservation reservation) {

        Reservation newReservation = new Reservation();
        Show newShow = showService.findById(id);
        newReservation.setFirstName(reservation.getFirstName());
        newReservation.setLastName(reservation.getLastName());
        newReservation.setEmail(reservation.getEmail());
        newReservation.setTelephone(reservation.getTelephone());
        newReservation.setNumberOfTickets(reservation.getNumberOfTickets());
        newReservation.setShowId(newShow);

        reservationRepository.save(newReservation);

        model.addAttribute("firstName", newReservation.getFirstName());
        model.addAttribute("lastName", newReservation.getLastName());
        model.addAttribute("email", newReservation.getEmail());
        model.addAttribute("telephone", newReservation.getTelephone());
        model.addAttribute("showId", newReservation.getShowId());
        model.addAttribute("numberOfTickets", newReservation.getNumberOfTickets());
        return "confirmReservation";
    }
}
