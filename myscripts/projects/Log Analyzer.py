import re
from collections import defaultdict

# log file path
log_file = "auth.log"

failed_attempts = defaultdict(int)
successful_logins = defaultdict(int)

# regex patterns
failed_pattern = re.compile(r"Failed password for .* from (\d+\.\d+\.\d+\.\d+)")
success_pattern = re.compile(r"Accepted password for .* from (\d+\.\d+\.\d+\.\d+)")

with open(log_file, "r") as file:
    for line in file:
        
        failed_match = failed_pattern.search(line)
        if failed_match:
            ip = failed_match.group(1)
            failed_attempts[ip] += 1

        success_match = success_pattern.search(line)
        if success_match:
            ip = success_match.group(1)
            successful_logins[ip] += 1

print("\n---- Failed Login Attempts ----")
for ip, count in failed_attempts.items():
    print(f"{ip} : {count}")

print("\n---- Successful Logins ----")
for ip, count in successful_logins.items():
    print(f"{ip} : {count}")

print("\n---- Suspicious IPs (More than 5 failures) ----")
for ip, count in failed_attempts.items():
    if count > 5:
        print(f"⚠️ Possible brute force attack from {ip}")
