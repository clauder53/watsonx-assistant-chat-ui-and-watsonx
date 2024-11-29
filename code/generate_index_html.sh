#!/bin/bash

########################################
# Create a file based on the environment variables
# given by the dockerc run -e parameter
# - REGION
# - INTEGRATION_ID
# - SERVICE_INSTANCE_ID
########################################
cat <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>IBM watsonx Assistant web chat toolkit</title>
  <style>
    body, html {
      width: 100%;
      height: 100%;
      margin: 0;
      padding: 0;
    }

    body {
      overflow: hidden;
    }

    .WebChatContainer {
      position: absolute;
      width: calc(100%/(1));
      right: 0;
      top: 16px;
      bottom: 16px;
    }

    #WACContainer.WACContainer .WebChatStyles {
      position: relative;
      transition: right 500ms ease-in-out;
    }

    #WACContainer.WACContainer .StartOpenAnimation {
      transition: none;
      right: -500px;
    }

    #WACContainer.WACContainer .OpenAnimation {
      right: 16px;
    }

    #WACContainer.WACContainer .CloseAnimation {
      right: -500px;
    }
    
    /* background of the full screen */
    body {
     background-color: #2596be;
    }
  </style>
</head>
<body>
  <div class="WebChatContainer"></div>

  <script>
    const customElement = document.querySelector('.WebChatContainer');
    let stylesInitialized = false;

    /**
     * This is the function that is called when the web chat code has been loaded and it is ready to be rendered.
     */
    async function onLoad(instance) {
      await instance.render();
    }

    // This is the standard web chat configuration object. You can modify these values with the embed code for your
    // own assistant if you wish to try this example with your assistant. You can find the documentation for this at
    // https://web-chat.global.assistant.watson.cloud.ibm.com/docs.html?to=api-configuration#configurationobject.
    window.watsonAssistantChatOptions = {
      integrationID: "${INTEGRATION_ID}", // The ID of this integration.
      region: "${REGION}", // The region your integration is hosted in.
      serviceInstanceID: "ad6466d7-a83e-4eaf-a642-0a2f6431c3dc", // The ID of your service instance.
      openChatByDefault: true,
      headerConfig: {
        showRestartButton: true,
      },  
      themeConfig: {
       corners: 'square',
      },
      layout: {
        showFrame: true,
        hasContentMaxWidth: true,
      },
      // This is where we provide the custom element to web chat so it knows where it is supposed to be placed.
      element: customElement,
      onLoad: onLoad
    };
    setTimeout(function(){const t=document.createElement('script');t.src="https://web-chat.global.assistant.watson.appdomain.cloud/versions/" + (window.watsonAssistantChatOptions.clientVersion || 'latest') + "/WatsonAssistantChatEntry.js";document.head.appendChild(t);});
  </script>

</body>
</html>
EOF