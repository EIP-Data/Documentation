===================================
Chromium Extension Developer Guide
===================================

Introduction
============

This document provides essential information for developers working on our Chromium extension. It covers setup instructions, extension structure, and key development processes.

Getting Started
===============

Prerequisites
-------------

- Google Chrome or a Chromium-based browser
- A code editor (e.g., Visual Studio Code, Sublime Text)
- Basic knowledge of HTML, CSS, and JavaScript

Setup
-----

1. Clone the repository:

   .. code-block:: bash

      git clone https://github.com/your-org/your-extension.git
      cd your-extension

2. Open Chrome and navigate to ``chrome://extensions``
3. Enable "Developer mode" in the top right corner
4. Click "Load unpacked" and select your extension's directory

Extension Structure
===================

.. code-block:: text

   your-extension/
   ├── manifest.json
   ├── background.js
   ├── popup/
   │   ├── popup.html
   │   ├── popup.css
   │   └── popup.js
   ├── content_scripts/
   │   └── content.js
   └── icons/
       ├── icon16.png
       ├── icon48.png
       └── icon128.png

Key Components
--------------

- ``manifest.json``: The extension's configuration file
- ``background.js``: Background script for long-running tasks
- ``popup/``: Files for the extension's popup UI
- ``content_scripts/``: Scripts that interact with web pages
- ``icons/``: Extension icons in various sizes

Development Workflow
====================

Coding Standards
----------------

- Follow JavaScript Standard Style for consistency
- Use ES6+ features where appropriate
- Keep functions small and focused

Testing
-------

1. Manual testing:
   - Load the extension in Chrome
   - Test all features thoroughly
   - Check for console errors

2. Automated testing (if applicable):
   - Use Jest for unit testing
   - Run tests with:

     .. code-block:: bash

        npm test

Debugging
---------

- Use ``console.log()`` for basic debugging
- Utilize Chrome DevTools for advanced debugging:
  - Inspect popup: Right-click extension icon > Inspect popup
  - Debug background script: Go to ``chrome://extensions``, click "background page" under your extension

Building and Publishing
=======================

Building the Extension
----------------------

1. Update ``manifest.json`` with the new version number
2. Create a zip file of your extension directory

Publishing to Chrome Web Store
------------------------------

1. Go to the `Chrome Developer Dashboard <https://chrome.google.com/webstore/developer/dashboard>`_
2. Click "New Item" and upload your zip file
3. Fill in all required fields (description, screenshots, etc.)
4. Submit for review

API Reference
=============

Chrome Extension APIs
---------------------

Our extension primarily uses the following Chrome APIs:

- ``chrome.runtime``: For background script communication
- ``chrome.tabs``: For interacting with browser tabs
- ``chrome.storage``: For storing extension data

Custom Modules
--------------

.. code-block:: javascript

   // Example of documenting a custom module
   /**
    * Utility functions for data processing
    * @module utils
    */

   /**
    * Processes user data
    * @param {Object} data - The user data object
    * @returns {Object} Processed data
    */
   function processUserData(data) {
     // Implementation details
   }

Troubleshooting
===============

Common Issues
-------------

1. **Issue**: Extension not loading
   **Solution**: Ensure ``manifest.json`` is valid and all referenced files exist

2. **Issue**: Content script not working
   **Solution**: Check if the content script is properly declared in ``manifest.json`` and matches the intended web pages

Getting Help
------------

For additional assistance:

- Check the `Chrome Extension documentation <https://developer.chrome.com/docs/extensions/>`_
- Contact the development team at extension-dev@example.com

Change Log
==========

.. changelog::
   :version: 1.0.0
   :released: 2023-05-15

   * Initial release of the Chromium extension
