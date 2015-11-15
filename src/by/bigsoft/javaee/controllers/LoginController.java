package by.bigsoft.javaee.controllers;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigInteger;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItem;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.h2.engine.SysProperties;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import by.bigsoft.javaee.dal.CrudDao;
import by.bigsoft.javaee.dal.CrudDaoBean;
import by.bigsoft.javaee.entity.Comments;
import by.bigsoft.javaee.entity.Music;
import by.bigsoft.javaee.entity.Playlist;
import by.bigsoft.javaee.entity.SearchMusic;
import by.bigsoft.javaee.entity.User;
import by.bigsoft.javaee.hibUtil.HibernateUtil;

@Controller
public class LoginController {

	@Autowired
	private CrudDao crudDao;

	@RequestMapping("/login")
	public String Login(Model model) throws IOException {
		/*
		 * Session session = HibernateUtil.currentSession(); Transaction
		 * transaction = session.beginTransaction(); Query q =
		 * session.createQuery("from User where login =?"); q.setParameter(0,
		 * "admin"); User user = (User) q.uniqueResult();
		 * 
		 * Music music = new Music(); Playlist playlist = new Playlist();
		 * music.setAuthor("Nautilus Pompilius"); music.setGenre("Rock");
		 * music.setName_song("Крылья");
		 * music.setPath("E:/Music/955808fb8ef8.mp3"); Path path =
		 * Paths.get("E:/Music/955808fb8ef8.mp3"); byte[] song =
		 * Files.readAllBytes(path); music.setSong(song);
		 * playlist.setMusic(music); playlist.setUser(user);
		 * session.saveOrUpdate(music); session.saveOrUpdate(playlist);
		 * transaction.commit();
		 */
		return "login";
	}

	@RequestMapping(value = "/login/check", method = RequestMethod.POST)
	public String LoginCheck(@ModelAttribute User user, Errors error,
			Model model, HttpSession httpSession) {
		int x = 0;
		Session session = HibernateUtil.currentSession();
		Query q = session.createSQLQuery("select login from user");
		List<String> loginlist = q.list();
		q = session.createSQLQuery("select password from user");
		List<String> passlist = q.list();
		while (x < loginlist.size()) {
			if (user.getLogin().equals(loginlist.get(x))
					& user.getPassword().equals(passlist.get(x))) {
				Query qr = session
						.createQuery("from User where login = :login ");
				qr.setParameter("login", user.getLogin());
				User actU = (User) qr.uniqueResult();
				httpSession.setAttribute("user", actU);
				model.addAttribute("user", actU);
				return "main";
			}
			x++;
		}
		error.rejectValue("login", "login", "Неверный логин или пароль");
		x = 0;
		return "login";
	}

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String Main(@ModelAttribute User user, Model model,
			HttpSession httpSession) {
		User actU = (User) httpSession.getAttribute("user");
		model.addAttribute("user", actU);
		return "main";
	}

	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String Profile(@ModelAttribute User user, Model model,
			HttpSession httpSession) {
		User actU = (User) httpSession.getAttribute("user");
		model.addAttribute("user", actU);
		return "profile";
	}

	@RequestMapping("/profile/change")
	public String ProfileChange(@ModelAttribute User user, Model model,
			HttpSession httpSession) {
		User actU = (User) httpSession.getAttribute("user");
		Session session = HibernateUtil.currentSession();
		Transaction transaction = session.beginTransaction();
		Query qr = session.createQuery("from User where id = :id ");
		qr.setParameter("id", actU.getId());
		actU = (User) qr.uniqueResult();
		actU.setLogin(user.getLogin());
		actU.setPassword(user.getPassword());
		actU.setName(user.getName());
		actU.setSurname(user.getSurname());
		actU.setEmail(user.getEmail());
		actU.setPhone(user.getPhone());
		actU.setCity(user.getCity());
		session.saveOrUpdate(actU);
		transaction.commit();
		Query qr2 = session
				.createQuery("from User where login = :login ");
		qr2.setParameter("login", user.getLogin());
		actU = (User) qr2.uniqueResult();
		httpSession.setAttribute("user", actU);
		model.addAttribute("user", actU);
		// Query q =
		// session.createQuery("update User set login = :login, password = :password, name = :name, surname = :surname, email = :email, city = :city, phone = :phone where id = :id");
		// q.setParameter("login", user.getLogin());
		// q.setParameter("password", user.getPassword());
		// q.setParameter("name", user.getName());
		// q.setParameter("surname", user.getSurname());
		// q.setParameter("email", user.getEmail());
		// q.setParameter("phone", user.getPhone());
		// q.setParameter("city", user.getCity());
		// q.setParameter("id", actU.getId());
		// int c = q.executeUpdate();
		// Query q = session.createQuery("from User where id =?");
		// qr.setParameter(0, actU.getId());
		// User upUser = (User) q.uniqueResult();
		// model.addAttribute("user", upUser);
		return "profile";
	}

	@RequestMapping("/upload")
	public String Upload(@ModelAttribute Music music, Model model) {
		return "upload";
	}

	@RequestMapping("/about_us")
	public String About_us(@ModelAttribute Music music, Model model) {
		return "about_us";
	}

	//@RequestMapping("/upload/up")
	@RequestMapping(value = "/upload/up", method = RequestMethod.POST)
	public String UploadUp(@ModelAttribute MultipartFile file, Model model, Music music)
			throws IOException {
		Session session = HibernateUtil.currentSession();
		Transaction transaction = session.beginTransaction();
		byte[] song = file.getBytes();
		InputStream inputStream = new ByteArrayInputStream(song);
		music.setSong(song);
		session.saveOrUpdate(music);
		transaction.commit();
		return "upload";
	}

	@RequestMapping("/library")
	public String Library(Model model) {
		List<Music> music = crudDao.list(Music.class);
		model.addAttribute("music", music);
		return "library";
	}

	@RequestMapping("/library/search")
	public String LibrarySearch(@ModelAttribute SearchMusic search, Model model) {
		System.out.println("yasya");
		Session session = HibernateUtil.currentSession();
		// Query qr =
		// session.createQuery("from Music where author and name_song = :search ");
		// String searchstr = search.getSearch() + "%";
		// System.out.println(searchstr);
		// qr.setParameter("search", searchstr);
		Criteria criteria = session.createCriteria(Music.class);
		Criterion searchcrt = Restrictions.ilike("author", search.getSearch(),
				MatchMode.ANYWHERE);
		criteria.add(searchcrt);
		List<Music> music = criteria.list();
		model.addAttribute("music", music);
		return "library";
	}

	@RequestMapping("/music")
	public String OutMusic(@RequestParam("id") Long Id, HttpServletResponse resp)
			throws IOException {
		Music music = crudDao.find(Music.class, Id);
		resp.setContentType("audio/mpeg");
		OutputStream out = resp.getOutputStream();
		resp.setContentLength(music.getSong().length);
		out.write(music.getSong());
		out.close();
		return "library";
	}

	@RequestMapping(value = "/addmusic", method = RequestMethod.POST)
	public String AddMusic(@RequestParam("id") Long Id, HttpSession httpSession) {
		Session session = HibernateUtil.currentSession();
		Transaction transaction = session.beginTransaction();
		Playlist playlist = new Playlist();
		User actU = (User) httpSession.getAttribute("user");
		Music music = crudDao.find(Music.class, Id);
		playlist.setMusic(music);
		playlist.setUser(actU);
		session.saveOrUpdate(playlist);
		transaction.commit();
		return "library";
	}

	@RequestMapping("/playlist")
	public String Playlist(Model model, HttpSession httpSession) {
		User actU = (User) httpSession.getAttribute("user");
		Session session = HibernateUtil.currentSession();
		System.out.println(actU.getId());
		Query q = session
				.createSQLQuery("select song_id from playlist where name_user = :id2");
		// select * from music where id in(select song_id from playlist where
		// name_user = :id2)
		q.setParameter("id2", actU.getId());
		List<Integer> music = q.list();
		model.addAttribute("music", music);
		return "playlist";
	}

	@RequestMapping("/changeRap")
	public String ChangeRap(Model model) {
		Session session = HibernateUtil.currentSession();
		Query qr = session.createQuery("from Music where genre = :genre ");
		qr.setParameter("genre", "Rap");
		List<Music> music = qr.list();
		model.addAttribute("music", music);
		return "library";
	}

	@RequestMapping("/changeRock")
	public String ChangeRock(Model model) {
		Session session = HibernateUtil.currentSession();
		Query qr = session.createQuery("from Music where genre = :genre ");
		qr.setParameter("genre", "Rock");
		List<Music> music = qr.list();
		model.addAttribute("music", music);
		return "library";
	}

	@RequestMapping("/changeHV")
	public String ChangeHV(Model model) {
		Session session = HibernateUtil.currentSession();
		Query qr = session.createQuery("from Music where genre = :genre ");
		qr.setParameter("genre", "Heavy Metal");
		List<Music> music = qr.list();
		model.addAttribute("music", music);
		return "library";
	}

	@RequestMapping("/changePop")
	public String ChangePop(Model model) {
		Session session = HibernateUtil.currentSession();
		Query qr = session.createQuery("from Music where genre = :genre ");
		qr.setParameter("genre", "Pop");
		List<Music> music = qr.list();
		model.addAttribute("music", music);
		return "library";
	}

	@RequestMapping("/changeDance")
	public String ChangeDance(Model model) {
		Session session = HibernateUtil.currentSession();
		Query qr = session.createQuery("from Music where genre = :genre ");
		qr.setParameter("genre", "Dance");
		List<Music> music = qr.list();
		model.addAttribute("music", music);
		return "library";
	}

	@RequestMapping("/changeOther")
	public String ChangeOther(Model model) {
		Session session = HibernateUtil.currentSession();
		Query qr = session.createQuery("from Music where genre = :genre ");
		qr.setParameter("genre", "Other");
		List<Music> music = qr.list();
		model.addAttribute("music", music);
		return "library";
	}

	@RequestMapping("/reg")
	public String Reg(Model model) {
		return "registration";
	}

	@RequestMapping("/reg/check")
	public String RegCheck(@ModelAttribute User user, Errors error, Model model) {
		Session session = HibernateUtil.currentSession();
		Query q = session.createSQLQuery("select login from user");
		List<String> loginlist = q.list();
		q = session.createSQLQuery("select email from user");
		List<String> emaillist = q.list();
		q = session.createSQLQuery("select phone from user");
		List<String> phonelist = q.list();
		int x = 0;
		while (x < loginlist.size()) {
			if (user.getLogin().equals(loginlist.get(x))) {
				error.rejectValue("login", "login",
						"Пользователь с таким логином уже существует");
				x = 0;
				break;
			}
			x++;
		}
		x = 0;

		while (x < emaillist.size()) {
			if (user.getEmail().equals(emaillist.get(x))) {
				error.rejectValue("email", "email",
						"Пользователь с таким e-mail уже существует");
				x = 0;
				break;
			}
			x++;
		}
		x = 0;

		while (x < phonelist.size()) {
			if (user.getPhone().equals(phonelist.get(x))) {
				error.rejectValue("phone", "phone",
						"Пользователь с таким телефоном уже существует");
				x = 0;
				break;
			}
			x++;
		}
		x = 0;

		if (error.hasErrors()) {
			return "registration";
		}
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(user);
		transaction.commit();
		error.rejectValue("login", "login", "Теперь вы можете войти =)");
		return "login";
	}

	@RequestMapping("/logout")
	public String LogOut(Model model) {
		return "login";
	}

	@RequestMapping(value = "/song", method = RequestMethod.GET)
	public String Song(@RequestParam("id") Long Id, Model model,
			HttpSession httpSession) throws IOException {
		Session session = HibernateUtil.currentSession();
		User actU = (User) httpSession.getAttribute("user");
		Music music = crudDao.find(Music.class, Id);
		Query qr = session.createQuery("from Comments where id_song = :id ");
		qr.setParameter("id", Id);
		List<Comments> comm = qr.list();
		model.addAttribute("comm", comm);
		model.addAttribute("user", actU);
		model.addAttribute("music", music);
		return "song";
	}

	@RequestMapping(value = "/song/comm", method = RequestMethod.POST)
	public String SongComm(@RequestParam("id") Long Id,
			@ModelAttribute Comments comment, Errors error, Model model) {
		Session session = HibernateUtil.currentSession();
		Transaction transaction = session.beginTransaction();
		Music music = crudDao.find(Music.class, Id);
		System.out.println(music.getId());
		comment.setDate(new Date());
		comment.setMusic(music);
		session.save(comment);
		transaction.commit();
		Query qr = session.createQuery("from Comments where id_song = :id ");
		qr.setParameter("id", Id);
		List<Comments> comm = qr.list();
		model.addAttribute("comm", comm);
		model.addAttribute("music", music);
		return "song";
	}

	@ModelAttribute("user")
	public User populateUser() {
		return new User();
	}
}
