@tinymce6 @tinymce6_wiris @wiris_mathtype @tinymce6_edit_formula @mtmoodle-101
Feature: Delete formula that is being edited
In order to check if MathType formula can be formulas in edition
As an admin
I need to create a MathType formula

Background:
    Given the following config values are set as admin:
      | config | value | plugin |
      | customtoolbar | tiny_mce_wiris_formulaEditor | editor_tiny |
    And the following "courses" exist:
      | fullname | shortname | format |
      | Course 1 | C1        | topics |
    And the following "course enrolments" exist:
      | user     | course | role           |
      | admin  | C1     | editingteacher |
    And the "wiris" filter is "on"
    And the "mathjaxloader" filter is "off"
    And the "urltolink" filter is "off"
    And I log in as "admin"

  @javascript @4.x @4.x_tinymce6 
  Scenario: MTMOODLE-101 - Edit formula being deleted
    # Course
    And I am on "Course 1" course homepage with editing mode on
    And I add a "Page" to section "0" using the activity chooser
    And I set the following fields to these values:
      | Name | Test MathType for TinyMCE6 on Moodle chemistry formulas |
    # Insert formula.
    And I press "MathType" in "Page content" field in TinyMCE 6 editor
    And I wait until MathType editor is displayed
    And I wait "3" seconds
    And I set MathType formula to '<math xmlns="http://www.w3.org/1998/Math/MathML"><mn>1</mn><mo>+</mo><mn>1</mn></math>'
    And I press accept button in MathType Editor
    And I wait "1" seconds
    # Assert that dbClick works
    ## Go to the editor's iframe to select the wirisformula
    And I switch to iframe with locator "id_page_ifr"
    And I wait until Wirisformula formula exists
    And I dbClick on WirisFormula with alt equals to "1 plus 1"
    ## Return to the default frame to check if MathType editor opened
    And I return to default frame
    And I wait until MathType editor is displayed
    ## Go again to the editor's iframe to delete the formula while opened by MathType
    And I switch to iframe with locator "id_page_ifr"
    And I click on WirisFormula with alt equals to "1 plus 1"
    And I press the enter key
    ## Return for last time to default frame to interact with buttons
    And I return to default frame
    And I press accept button in MathType Editor
    And I press "Save and display"
    # Check final formula
    Then Wirisformula should not exist

  @javascript @4.0 @4.0_tinymce6
  Scenario: MTMOODLE-101 - Edit formula being deleted
    # Course
    And I am on "Course 1" course homepage with editing mode on
    And I add a "Page" to section "0"
    And I set the following fields to these values:
      | Name | Test MathType for TinyMCE6 on Moodle chemistry formulas |
    # Insert formula.
    And I press "MathType" in "Page content" field in TinyMCE 6 editor
    And I wait until MathType editor is displayed
    And I wait "2" seconds
    And I set MathType formula to '<math xmlns="http://www.w3.org/1998/Math/MathML"><mn>1</mn><mo>+</mo><mn>1</mn></math>'
    And I wait "1" seconds
    And I press accept button in MathType Editor
    # Assert that dbClick works
    ## Go to the editor's iframe to select click the wirisformula
    And I switch to iframe with locator "id_page_ifr"
    And I wait until Wirisformula formula exists
    And I dbClick on WirisFormula with alt equals to "1 plus 1"
    ## Return to the default frame to check if MathType editor opened
    And I return to default frame
    And I wait until MathType editor is displayed
    ## Go again to the editor's iframe to delete the formula while opened by MathType
    And I switch to iframe with locator "id_page_ifr"
    And I click on WirisFormula with alt equals to "1 plus 1"
    And I press the enter key
    ## Return for last time to default frame to interact with buttons
    And I return to default frame
    And I press accept button in MathType Editor
    And I press "Save and display"
    # Check final formula
    Then Wirisformula should not exist