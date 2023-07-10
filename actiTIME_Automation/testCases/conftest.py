import os
from datetime import datetime

import pytest
import pytest_html
from selenium import webdriver
import webdriver_manager
from selenium.common import NoSuchWindowException
from selenium.webdriver import DesiredCapabilities
from selenium.webdriver.support.abstract_event_listener import AbstractEventListener
from selenium.webdriver.support.event_firing_webdriver import EventFiringWebDriver
from webdriver_manager import driver
from webdriver_manager.chrome import ChromeDriverManager


@pytest.fixture()
def setup(browser):

    if browser == 'chrome':
        driver = webdriver.Chrome()
        driver.maximize_window()

        print("Launching chrome browser.........")
    elif browser == 'firefox':
        driver = webdriver.Firefox()
        print("Launching firefox browser.........")
    elif browser == 'edge':
        driver = webdriver.Edge()
        print("Launching edge browser.........")
    yield driver
    driver.quit()


def pytest_addoption(parser):
    parser.addoption("--browser")


@pytest.fixture()
def browser(request):
    return request.config.getoption("--browser")


def pytest_configure(config):
    config._metadata['Project Name'] = 'actiTIME Automation'
    config._metadata['Module Name'] = 'Login,Timecard modules'
    config._metadata['Tester'] = 'Student Name'


@pytest.mark.optionalhook
def pytest_metadata(metadata):
    metadata.pop("JAVA_HOME", None)
    metadata.pop("Plugins", None)


def pytest_html_report_title(report):
    report.title = "actiTIME Automation report title"


@pytest.hookimpl(hookwrapper=True)
def pytest_runtest_makereport(item, call):
    pytest_html = item.config.pluginmanager.getplugin('html')
    outcome = yield
    report = outcome.get_result()
   # extras = getattr(report, "extras", [])

    try:
        if report.when == "call" or report.when == "setup":
            # always add url to report
            xfail = hasattr(report, "wasxfail")
            if (report.skipped and xfail) or (report.failed and not xfail):
                file_name = datetime.now().strftime('%Y%m%d_%H%M%S') + ".png"
                screenshot_path = os.path.join(os.getcwd(), "Screenshots", file_name)
                driver = item.funcargs['setup']
                driver.get_screenshot_as_file(screenshot_path)
                extra = pytest_html.extras.image(screenshot_path)
                setattr(report, "extra", [extra] if hasattr(report, "extra") else [extra])
            #     if file_name:
            #         html = '<div><img src="%s" alt="screenshot" style="width:304px;height:228px" ' \
            #                'onclick="window.open(this.src)" align="right"/></div>' % file_name
            #     extras.append(pytest_html.extras.html(html))
            # report.extras = extras
    except NoSuchWindowException:
        print("Window is closed or web view not found. Cannot capture screenshot.")









