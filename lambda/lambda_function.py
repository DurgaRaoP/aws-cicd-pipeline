import json
import os
from datetime import datetime

def lambda_handler(event, context):
    version = os.environ.get('APP_VERSION', '1.0.0')
    deployed_at = os.environ.get('DEPLOYED_AT', 'unknown')

    print(json.dumps({
        "event": "lambda_invoked",
        "version": version,
        "deployed_at": deployed_at,
        "message": "CI/CD pipeline auto-triggered from GitHub push!"
    }))

    return {
        'statusCode': 200,
        'body': json.dumps({
            'message': f'Hello from version {version}',
            'deployed_at': deployed_at,
            'timestamp': datetime.utcnow().isoformat()
        })
    }
