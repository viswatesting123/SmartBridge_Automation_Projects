import static com.kms.katalon.core.checkpoint.CheckpointFactory.findCheckpoint
import static com.kms.katalon.core.testcase.TestCaseFactory.findTestCase
import static com.kms.katalon.core.testdata.TestDataFactory.findTestData
import static com.kms.katalon.core.testobject.ObjectRepository.findTestObject
import static com.kms.katalon.core.testobject.ObjectRepository.findWindowsObject
import com.kms.katalon.core.checkpoint.Checkpoint as Checkpoint
import com.kms.katalon.core.cucumber.keyword.CucumberBuiltinKeywords as CucumberKW
import com.kms.katalon.core.mobile.keyword.MobileBuiltInKeywords as Mobile
import com.kms.katalon.core.model.FailureHandling as FailureHandling
import com.kms.katalon.core.testcase.TestCase as TestCase
import com.kms.katalon.core.testdata.TestData as TestData
import com.kms.katalon.core.testng.keyword.TestNGBuiltinKeywords as TestNGKW
import com.kms.katalon.core.testobject.TestObject as TestObject
import com.kms.katalon.core.webservice.keyword.WSBuiltInKeywords as WS
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUI
import com.kms.katalon.core.windows.keyword.WindowsBuiltinKeywords as Windows
import internal.GlobalVariable as GlobalVariable
import org.openqa.selenium.Keys as Keys

WebUI.openBrowser('')

WebUI.navigateToUrl('https://calendly.com/')

WebUI.maximizeWindow()

WebUI.click(findTestObject('Object Repository/Page_Object_Calendly/Page_Free Online Appointment Scheduling Sof_f04a6a/a_Log In'))

WebUI.click(findTestObject('Object Repository/Page_Object_Calendly/Page_/button_Cookie settings_onetrust-close-btn-h_0d9a83'))

WebUI.setText(findTestObject('Object Repository/Page_Object_Calendly/Page_Welcome back to Calendly. Log in to yo_d7c56c/input_Calendly_email'), 
    'automationpractic@gmail.com')

WebUI.click(findTestObject('Object Repository/Page_Object_Calendly/Page_Welcome back to Calendly. Log in to yo_d7c56c/button_Log in'))

WebUI.setEncryptedText(findTestObject('Object Repository/Page_Object_Calendly/Page_Log in - Calendly/input_Enter your password_password'), 
    'duhHTcrZlizKDpj1jPPK5MT4d6/SgyxG')

WebUI.delay(10)

WebUI.click(findTestObject('Page_Object_Calendly/Page_Log in - Calendly/div_Continue'))

WebUI.closeBrowser()

