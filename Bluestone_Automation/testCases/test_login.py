import time
import pytest
from pageObjects.LoginPage import LoginPage
from utilities.readProperties import ReadConfig
from utilities.customLogger import LogGen


class Test_Login():
    baseURL = ReadConfig.getApplicationURL()
    userName = ReadConfig.getUsername()
    password = ReadConfig.getPassword()
    logger = LogGen.loggen()

    # @pytest.mark.login
    def test_homePageTitle(self, setup):
        self.logger.info("*************** Test_001_Login *****************")
        self.logger.info("****Started Home page title test for automation ****")
        self.driver = setup
        self.logger.info("****Opening URL****")
        self.driver.get(self.baseURL)
        time.sleep(10)
        bluestone_title = self.driver.title
        if bluestone_title == "Online Jewellery Shopping Store India | Buy Gold and Diamond jewellery with Latest Designs 2023 | BlueStone.com":
            self.logger.info("**** Home page title test passed ****")
            assert True
        else:
            self.logger.error("**** Home page title test failed****")
            assert False

    @pytest.mark.login
    @pytest.mark.regression
    def test_login(self, setup):

        self.logger.info("****Started Login Test****")
        self.driver = setup
        self.driver.get(self.baseURL)
        self.lp = LoginPage(self.driver)
        self.lp.alertbutton()
        self.lp.loginbutton()
        self.lp.emailtype()
        self.lp.setUsername(self.userName)
        self.lp.setPassword(self.password)
        self.lp.clickLogin()
        time.sleep(10)
        bluestone_title = self.driver.title
        if bluestone_title == "Online Jewellery Shopping Store India | Buy Gold and Diamond jewellery with Latest Designs 2023 | BlueStone.com":
            self.logger.info("****Login test passed ****")
            assert True
        else:
            self.logger.error("****Login test failed ****")
            assert False
