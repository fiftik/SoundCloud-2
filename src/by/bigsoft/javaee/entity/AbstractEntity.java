package by.bigsoft.javaee.entity;

import javax.persistence.*;

@MappedSuperclass
public abstract class AbstractEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private Long id;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Override
	public boolean equals(Object o) {
		if (o == null || getClass() != o.getClass()) {
			return false;
		}

		AbstractEntity entity = (AbstractEntity) o;
		Long entityId = entity.getId();
		if (entityId == null || getId() == null) {
			return entityEquals(o);
		}

		return getId().equals(entity.getId());
	}

	@Override
	public int hashCode() {
		if (getId() != null) {
			return getId().hashCode();
		}

		return entityHashCode();
	}

	public abstract boolean entityEquals(Object o);

	public abstract int entityHashCode();
}
