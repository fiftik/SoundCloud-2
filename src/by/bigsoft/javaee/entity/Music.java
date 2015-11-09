package by.bigsoft.javaee.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Service;

@Entity
@Table(name= "music")
public class Music extends AbstractEntity{
	
	@Column(name = "author")
	private String author;
	
	@Column(name = "name_song")
	private String name_song;
	
	@Column(name = "song", length=1999999999)
	private byte[] song;
	
	@Column(name = "genre")
	private String genre;
	
	@Column(name = "path")
	private String path;
	
	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "music")
	private List<Playlist> playlist;
	
	

	public Music(String author, String name_song, byte[] song, String genre, String path,
			List<Playlist> playlist) {
		super();
		this.author = author;
		this.name_song = name_song;
		this.song = song;
		this.genre = genre;
		this.path = path;
		this.playlist = playlist;
	}

	public Music() {
		super();
	}

	public List<Playlist> getPlaylist() {
		return playlist;
	}

	public void setPlaylist(List<Playlist> playlist) {
		this.playlist = playlist;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getName_song() {
		return name_song;
	}

	public void setName_song(String name_song) {
		this.name_song = name_song;
	}

	public byte[] getSong() {
		return song;
	}

	public void setSong(byte[] song) {
		this.song = song;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
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
