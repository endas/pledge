// default package
// Generated Jul 14, 2016 11:10:17 PM by Hibernate Tools 5.1.0.Alpha1

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Goodspledge generated by hbm2java
 */
@Entity
@Table(name = "GOODSPLEDGE", catalog = "netgrains")
public class Goodspledge implements java.io.Serializable {

	private Long goodspledgeid;
	private Long goodscategoryone;
	private Long goodscategorytwo;
	private Long goodscategorythree;
	private Long goodssize;
	private Long goodsneworused;
	private Long goodscondition;
	private Long goodsquantity;
	private String additionalinformation;
	private String itemsize;
	private Date dateavailablefrom;
	private Date dateavailableto;
	private Long registerofpledgesid;
	private Long createdbyid;
	private Long updatedbyid;
	private Date datecreated;
	private Date dateupdated;

	public Goodspledge() {
	}

	public Goodspledge(Long goodscategoryone, Long goodscategorytwo, Long goodscategorythree, Long goodssize,
			Long goodsneworused, Long goodscondition, Long goodsquantity, String additionalinformation, String itemsize,
			Date dateavailablefrom, Date dateavailableto, Long registerofpledgesid, Long createdbyid, Long updatedbyid,
			Date datecreated, Date dateupdated) {
		this.goodscategoryone = goodscategoryone;
		this.goodscategorytwo = goodscategorytwo;
		this.goodscategorythree = goodscategorythree;
		this.goodssize = goodssize;
		this.goodsneworused = goodsneworused;
		this.goodscondition = goodscondition;
		this.goodsquantity = goodsquantity;
		this.additionalinformation = additionalinformation;
		this.itemsize = itemsize;
		this.dateavailablefrom = dateavailablefrom;
		this.dateavailableto = dateavailableto;
		this.registerofpledgesid = registerofpledgesid;
		this.createdbyid = createdbyid;
		this.updatedbyid = updatedbyid;
		this.datecreated = datecreated;
		this.dateupdated = dateupdated;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "GOODSPLEDGEID", unique = true, nullable = false)
	public Long getGoodspledgeid() {
		return this.goodspledgeid;
	}

	public void setGoodspledgeid(Long goodspledgeid) {
		this.goodspledgeid = goodspledgeid;
	}

	@Column(name = "GOODSCATEGORYONE")
	public Long getGoodscategoryone() {
		return this.goodscategoryone;
	}

	public void setGoodscategoryone(Long goodscategoryone) {
		this.goodscategoryone = goodscategoryone;
	}

	@Column(name = "GOODSCATEGORYTWO")
	public Long getGoodscategorytwo() {
		return this.goodscategorytwo;
	}

	public void setGoodscategorytwo(Long goodscategorytwo) {
		this.goodscategorytwo = goodscategorytwo;
	}

	@Column(name = "GOODSCATEGORYTHREE")
	public Long getGoodscategorythree() {
		return this.goodscategorythree;
	}

	public void setGoodscategorythree(Long goodscategorythree) {
		this.goodscategorythree = goodscategorythree;
	}

	@Column(name = "GOODSSIZE")
	public Long getGoodssize() {
		return this.goodssize;
	}

	public void setGoodssize(Long goodssize) {
		this.goodssize = goodssize;
	}

	@Column(name = "GOODSNEWORUSED")
	public Long getGoodsneworused() {
		return this.goodsneworused;
	}

	public void setGoodsneworused(Long goodsneworused) {
		this.goodsneworused = goodsneworused;
	}

	@Column(name = "GOODSCONDITION")
	public Long getGoodscondition() {
		return this.goodscondition;
	}

	public void setGoodscondition(Long goodscondition) {
		this.goodscondition = goodscondition;
	}

	@Column(name = "GOODSQUANTITY")
	public Long getGoodsquantity() {
		return this.goodsquantity;
	}

	public void setGoodsquantity(Long goodsquantity) {
		this.goodsquantity = goodsquantity;
	}

	@Column(name = "ADDITIONALINFORMATION")
	public String getAdditionalinformation() {
		return this.additionalinformation;
	}

	public void setAdditionalinformation(String additionalinformation) {
		this.additionalinformation = additionalinformation;
	}

	@Column(name = "ITEMSIZE")
	public String getItemsize() {
		return this.itemsize;
	}

	public void setItemsize(String itemsize) {
		this.itemsize = itemsize;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "DATEAVAILABLEFROM", length = 19)
	public Date getDateavailablefrom() {
		return this.dateavailablefrom;
	}

	public void setDateavailablefrom(Date dateavailablefrom) {
		this.dateavailablefrom = dateavailablefrom;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "DATEAVAILABLETO", length = 19)
	public Date getDateavailableto() {
		return this.dateavailableto;
	}

	public void setDateavailableto(Date dateavailableto) {
		this.dateavailableto = dateavailableto;
	}

	@Column(name = "REGISTEROFPLEDGESID")
	public Long getRegisterofpledgesid() {
		return this.registerofpledgesid;
	}

	public void setRegisterofpledgesid(Long registerofpledgesid) {
		this.registerofpledgesid = registerofpledgesid;
	}

	@Column(name = "CREATEDBYID")
	public Long getCreatedbyid() {
		return this.createdbyid;
	}

	public void setCreatedbyid(Long createdbyid) {
		this.createdbyid = createdbyid;
	}

	@Column(name = "UPDATEDBYID")
	public Long getUpdatedbyid() {
		return this.updatedbyid;
	}

	public void setUpdatedbyid(Long updatedbyid) {
		this.updatedbyid = updatedbyid;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "DATECREATED", length = 19)
	public Date getDatecreated() {
		return this.datecreated;
	}

	public void setDatecreated(Date datecreated) {
		this.datecreated = datecreated;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "DATEUPDATED", length = 19)
	public Date getDateupdated() {
		return this.dateupdated;
	}

	public void setDateupdated(Date dateupdated) {
		this.dateupdated = dateupdated;
	}

}
