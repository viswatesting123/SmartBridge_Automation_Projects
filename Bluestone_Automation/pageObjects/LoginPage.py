import time
from time import sleep
from selenium import webdriver
from selenium.webdriver.common.by import By


class LoginPage:
    # Login Page
    Login_btn_Xpath = "//div[@id='login']"
    Email_type_Xpath = "//a[@id='logInWithEmail']"
    Email_Xpath = "//input[@id='email-id']"
    Password_Xpath = "//input[@id='password']"
    Login_Xpath = "//input[@id='edit-login-account']"
    alert_Xpath="//span[@id='denyBtn']"

    def __init__(self, driver):
        self.driver = driver


    def alertbutton(self):
        time.sleep(5)
        self.driver.find_element(By.XPATH, self.alert_Xpath).click()

    def loginbutton(self):
        time.sleep(5)
        self.driver.find_element(By.XPATH, self.Login_btn_Xpath).click()

    def emailtype(self):
        time.sleep(5)
        self.driver.find_element(By.XPATH, self.Email_type_Xpath).click()

    def setUsername(self, username):
        self.driver.find_element(By.XPATH, self.Email_Xpath).send_keys(username)

    def setPassword(self, password):
        self.driver.find_element(By.XPATH, self.Password_Xpath).send_keys(password)

    def clickLogin(self):
        self.driver.find_element(By.XPATH, self.Login_Xpath).click()

    # def clickLogout(self):
    #
    #     self.driver.find_element(By.LINK_TEXT, self.link_logout_linktext).click()
