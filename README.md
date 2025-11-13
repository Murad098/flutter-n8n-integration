# Flowlink

**A powerful Flutter mobile application integrated with n8n workflow automation.**

Flowlink is a cross-platform mobile/web app that seamlessly connects with n8n, allowing you to trigger and manage automation workflows directly from your smartphone or web browser.

Features

**n8n Integration**: Connect with any n8n instance (local or cloud)
**Webhook Triggering**: Trigger workflows with custom JSON payloads
**Connection Testing**: Verify n8n connectivity before sending data
**Cross-Platform**: Works on iOS, Android, Web, Linux, macOS, and Windows
**Modern UI**: Clean, intuitive Material Design interface
**Real-time Response**: Instant feedback on workflow execution

##Quick Start

##Prerequisites
- Flutter SDK (v3.9.2+)
- n8n instance (local or remote)
- Optional: Docker (for easy n8n setup)

##Installation

```bash
# Clone the repository
git clone <your-repo>
cd flowlink

# Install dependencies
flutter pub get

# Run on Chrome (web)
flutter run -d chrome

# Or run on mobile
flutter run
```

### Setup Local n8n

**Using Docker (Easiest):**
```bash
docker run -it --rm -p 5678:5678 docker.io/n8nio/n8n
```

**Using npm:**
```bash
npm install -g n8n
n8n start
```

Then access n8n at: `http://localhost:5678`

##Documentation

- **[Setup Guide](./SETUP_GUIDE.md)** - Complete installation and configuration
- **[Quick Start](./QUICK_START.md)** - Quick reference card
- **[n8n Integration Guide](./N8N_INTEGRATION_GUIDE.md)** - Detailed n8n setup

##Architecture

```
lib/
├── main.dart                 # App entry point & UI
├── services/
│   └── n8n_service.dart     # n8n API client
└── models/
    └── n8n_models.dart      # Data models
```

### N8nService API

```dart
final service = N8nService(baseUrl: 'http://localhost:5678');

// Test connection
bool connected = await service.testConnection();

// Trigger workflow
final result = await service.triggerWorkflow({
  'message': 'Hello from Flowlink!'
});

// Get workflows
final workflows = await service.getWorkflows();
```

##Usage Steps

## 1. Launch Flowlink
```bash
flutter run -d chrome
```

## 2. Configure n8n
- Enter n8n Base URL: `http://localhost:5678`
- Click "Test Connection"

## 3. Create Webhook in n8n
- Add "Webhook" node to workflow
- Set method to "POST"
- Deploy workflow

## 4. Trigger Workflow from Flowlink
- Paste webhook URL
- Enter JSON payload
- Click "Trigger Workflow"

## Development

## Building for Production

**Android:**
```bash
flutter build apk --release
```

**iOS:**
```bash
flutter build ios --release
```

**Web:**
```bash
flutter build web --release
```

### Running Tests
```bash
flutter test
```

### Code Formatting
```bash
flutter format lib/
```

##Dependencies

- **flutter**: Flutter SDK
- **http**: HTTP client for API calls
- **cupertino_icons**: iOS-style icons
- **json_annotation**: JSON serialization

##Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

##License

This project is open source and available under the MIT License.

##Troubleshooting

### Connection Failed
- Verify n8n is running
- Check URL format
- Ensure firewall allows connections

### Webhook Not Triggering
- Confirm workflow is activated
- Check webhook URL is correct
- Validate JSON payload

### CORS Issues (Web)
- Use `http://127.0.0.1:5678` instead of `localhost`
- Or set up a CORS proxy
- Check browser console for errors

##Support

- [n8n Documentation](https://docs.n8n.io/)
- [Flutter Documentation](https://flutter.dev/)
- Check GitHub Issues for known problems

##Roadmap

- [ ] Advanced authentication (API keys, OAuth)
- [ ] Workflow list view
- [ ] Response history/logging
- [ ] Batch workflow triggering
- [ ] Workflow templates library
- [ ] Push notifications

---

**Made with for automation enthusiasts**

*Last Updated: November 11, 2025*


