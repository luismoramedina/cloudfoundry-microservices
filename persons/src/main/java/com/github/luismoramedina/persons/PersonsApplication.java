package com.github.luismoramedina.persons;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.context.annotation.Bean;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;

@SpringBootApplication
@RestController
@EnableDiscoveryClient
@EnableEurekaClient
public class PersonsApplication {

	@Autowired
	private RestTemplate restTemplate;

	@Value("${accounts.url}")
	private String accountsUrl;

	public static void main(String[] args) {
		SpringApplication.run(PersonsApplication.class, args);
	}

	@Bean
	@LoadBalanced
	public RestTemplate restTemplate() {
		return new RestTemplate();
	}

	@GetMapping("/")
	public Person person() {
		Person person = new Person();
		person.setName("Luis");
		URI url = UriComponentsBuilder.fromUriString(accountsUrl).build().toUri();
		person.setAccount(restTemplate.getForObject(url, Account.class));
		return person;
	}


}

