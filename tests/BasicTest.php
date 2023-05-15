<?php

use Drupal\Tests\BrowserTestBase;

/**
 * Tests that the Home URL is reachable.
 */
class BasicTest extends BrowserTestBase {
  protected static $modules = ['node'];
  protected $defaultTheme = 'stark';

  public function testHomePage() {
    $this->drupalGet('');
    $this->assertSession()->statusCodeEquals(200);
  }
}
