package by.bigsoft.javaee.entity;

import java.util.Date;

import javax.persistence.*;

@Entity
@Table(name = "comments")
public class Comments extends AbstractEntity {
	
	@Column(name = "comment")
	private String comment;
	
	@Column(name = "date")
	private Date date;
	
	@Column(name = "name_user")
	private String name_user;
	
	@ManyToOne(fetch = FetchType.LAZY, cascade = {CascadeType.MERGE, CascadeType.PERSIST})
	@JoinColumn(name = "id_song", nullable=false)
	private Music music;	
	
	public String getName_user() {
		return name_user;
	}

	public void setName_user(String name_user) {
		this.name_user = name_user;
	}

	public Date getDate() {
		return date;
	}

	public Music getMusic() {
		return music;
	}

	public void setMusic(Music music) {
		this.music = music;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	@Override
	public boolean entityEquals(Object o) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int entityHashCode() {
		// TODO Auto-generated method stub
		return 0;
	}

}
