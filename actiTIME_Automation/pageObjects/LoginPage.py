import time
from time import sleep
from selenium import webdriver
from selenium.webdriver.common.by import By

class LoginPage:
    # Login Page
    Login_btn_Xpath = "//a[text()='Log in']"
    User_Name_Xpath = "//input[@id='username']"
    Password_Xpath = "//input[@name='pwd']"
    Login_Xpath = "//a[@id='loginButton']"
    Homepage_Value="Enter Time-Track for"

    def __init__(self,driver):
        self.driver=driver




    def setUserName(self, username):

        self.driver.find_element(By.XPATH, self.User_Name_Xpath).send_keys(username)

    def setPassword(self, password):

        self.driver.find_element(By.XPATH, self.Password_Xpath).send_keys(password)

    def clickLogin(self):
         self.driver.find_element(By.XPATH, self.Login_Xpath).click()

    # def clickLogout(self):
    #
    #     self.driver.find_element(By.LINK_TEXT, self.link_logout_linktext).click()