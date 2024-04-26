def clean_status_log(filename):
    try:
        with open(filename, 'r+') as file:
            lines = file.readlines()

            # Find the index of the last occurrence of "NEW FLIGHT"
            last_index = None
            for i in range(len(lines) - 1, -1, -1):
                if "NEW FLIGHT" in lines[i]:
                    last_index = i
                    break

            if last_index is not None:
                # Truncate the file content to include only lines after the last occurrence of "NEW FLIGHT"
                file.seek(0)
                file.truncate()
                file.writelines(lines[last_index:])

            print("Status log cleaned successfully.")
    except FileNotFoundError:
        print(f"File '{filename}' not found.")
    except Exception as e:
        print(f"An error occurred: {e}")

# Replace 'status_log.txt' with your actual file name
clean_status_log('/home/pce/status_log.txt')