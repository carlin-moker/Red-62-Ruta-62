import http.server
import socketserver
import json

PORT = 8080

class CosmicHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type", "application/json")
        self.end_headers()
        metrics = {"status": "OPERATIVO", "nodo": "CosmicGem-Principal", "Red": "Red-62"}
        self.wfile.write(json.dumps(metrics).encode())

if __name__ == "__main__":
    with socketserver.TCPServer(("", PORT), CosmicHandler) as server:
        print(f"🌍 CosmicGem activo en puerto {PORT}")
        server.serve_forever()

