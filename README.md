#React Native Document Interaction Controller

This package calls UIDocumentInteractionController for IOS to preview document.

This version is a merge of :
https://github.com/twksos/react-native-document-interaction-controller
https://github.com/wix-incubator/react-native-document-interaction-controller

None of both projects above worked, so I did a mix of both that actually works with react-native v0.64.2

### Installation:

`npm i react-native-document-interaction-controller --save`

### Usage

```
import DocumentInteractionController from 'react-native-document-interaction-controller';

DocumentInteractionController.preview(localFilePath);
```

### Miscellaneous

To preview a remote file, download with `react-native-fs`.
