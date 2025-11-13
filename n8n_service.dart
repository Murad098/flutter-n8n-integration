import 'package:http/http.dart' as http;
import 'dart:convert';

/// Service for interacting with n8n workflows
class N8nService {
  late String _baseUrl;
  late String _webhookUrl;

  N8nService({
    String baseUrl = 'http://localhost:5678',
    String webhookUrl = '',
  }) {
    _baseUrl = baseUrl;
    _webhookUrl = webhookUrl;
  }

  /// Set the n8n base URL
  void setBaseUrl(String url) {
    _baseUrl = url;
  }

  /// Set the webhook URL for workflow triggering
  void setWebhookUrl(String url) {
    _webhookUrl = url;
  }

  /// Trigger a workflow via webhook
  Future<Map<String, dynamic>> triggerWorkflow(
    Map<String, dynamic> payload, {
    String? webhookUrl,
  }) async {
    try {
      final url = webhookUrl ?? _webhookUrl;
      
      if (url.isEmpty) {
        throw Exception('Webhook URL is not configured');
      }

      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(payload),
      ).timeout(
        const Duration(seconds: 30),
        onTimeout: () => throw Exception('Request timeout'),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return {
          'success': true,
          'data': jsonDecode(response.body),
          'statusCode': response.statusCode,
        };
      } else {
        return {
          'success': false,
          'error': 'Failed with status code: ${response.statusCode}',
          'statusCode': response.statusCode,
        };
      }
    } catch (e) {
      return {
        'success': false,
        'error': 'Error: ${e.toString()}',
      };
    }
  }

  /// Get workflow list from n8n (requires API access)
  Future<Map<String, dynamic>> getWorkflows() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/api/v1/workflows'),
        headers: {
          'Content-Type': 'application/json',
        },
      ).timeout(
        const Duration(seconds: 30),
        onTimeout: () => throw Exception('Request timeout'),
      );

      if (response.statusCode == 200) {
        return {
          'success': true,
          'data': jsonDecode(response.body),
        };
      } else {
        return {
          'success': false,
          'error': 'Failed to fetch workflows',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'error': 'Error: ${e.toString()}',
      };
    }
  }

  /// Test connection to n8n instance
  Future<bool> testConnection() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/api/v1/health'),
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () => throw Exception('Request timeout'),
      );

      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
