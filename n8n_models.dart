/// Model for n8n workflow response
class N8nResponse {
  final bool success;
  final dynamic data;
  final String? error;
  final int? statusCode;

  N8nResponse({
    required this.success,
    this.data,
    this.error,
    this.statusCode,
  });

  factory N8nResponse.fromJson(Map<String, dynamic> json) {
    return N8nResponse(
      success: json['success'] ?? false,
      data: json['data'],
      error: json['error'],
      statusCode: json['statusCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data,
      'error': error,
      'statusCode': statusCode,
    };
  }
}

/// Model for n8n workflow metadata
class N8nWorkflow {
  final String id;
  final String name;
  final String? description;
  final bool active;
  final DateTime createdAt;
  final DateTime updatedAt;

  N8nWorkflow({
    required this.id,
    required this.name,
    this.description,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
  });

  factory N8nWorkflow.fromJson(Map<String, dynamic> json) {
    return N8nWorkflow(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'],
      active: json['active'] ?? false,
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updatedAt'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'active': active,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
