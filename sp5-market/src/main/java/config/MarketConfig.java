package config;
import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import member.MemberDao;
import member.MemberRegisterService;
import member.ChangePasswordService;
import member.MemberDeleteService;

	// DB연결 
	// 서비스 클래스와 DAO 클래스를 위한 설정클래스
	@Configuration
	@EnableTransactionManagement
	public class MarketConfig {
		@Bean(destroyMethod = "close")
		public DataSource dataSource() {
			DataSource ds = new DataSource();
			ds.setDriverClassName("com.mysql.jdbc.Driver");
			ds.setUrl("jdbc:mysql://localhost/market?characterEncoding=utf8");
			ds.setUsername("marketManager");
			ds.setPassword("market");
			ds.setInitialSize(2);
			ds.setMaxActive(10);
			ds.setTestWhileIdle(true);
			ds.setMinEvictableIdleTimeMillis(1000*60*3); //최소 우휴시간 3분
			ds.setTimeBetweenEvictionRunsMillis(1000*10); //10초 주기로  유휴 컨넥션 유효여부
			return ds;
		}
		
		@Bean
		public PlatformTransactionManager platformTransactionManager() {
			DataSourceTransactionManager tm = new DataSourceTransactionManager();
			tm.setDataSource(dataSource());
			return tm;
		}
		
		@Bean
		public MemberDao memberDao() {
			return new MemberDao(dataSource());
		}
		
		@Bean
		public MemberRegisterService memberRegisterService() {
			return new MemberRegisterService(memberDao());
		}
		
		@Bean 
		public ChangePasswordService changePasswordService() {
			return new ChangePasswordService(memberDao());
		}
		
		@Bean
		public MemberDeleteService memberDeleteService() {
			return new MemberDeleteService(memberDao());
		}
		
		
	}
