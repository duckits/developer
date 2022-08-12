create database keycloak;
create user keycloak with encrypted password 'p@s5w0rd';
grant all privileges on database keycloak to keycloak;
