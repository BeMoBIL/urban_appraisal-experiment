import pickle
import numpy as np

# Define the paths for the files and images
original_pickle_file = '/Users/carolinazahme/Desktop/analysis_scripts/segmentation/segmentation_results.pickle'
new_pickle_file = '/Users/carolinazahme/Desktop/analysis_scripts/segmentation/adjusted_segmentation_results.pickle'

# Load the original pickle file
with open(original_pickle_file, 'rb') as file:
    data = pickle.load(file)

# Screen dimensions in pixels
screen_width_px = 2560
screen_height_px = 1440

# PPI and frame dimensions in pixels
ppi = 108.7855
frame_width_mm = 87.5
frame_height_mm = 31.5
frame_width_px = frame_width_mm / 25.4 * ppi
frame_height_px = frame_height_mm / 25.4 * ppi

# Calculate offsets to center the image within the screen
offset_x = int(frame_width_px)
offset_y = int(frame_height_px)

def adjust_coordinates(segmentation, offset_x, offset_y):
    height, width = segmentation.shape
    new_segmentation = np.zeros((height + 2 * offset_y, width + 2 * offset_x), dtype=segmentation.dtype)
    
    for y in range(height):
        for x in range(width):
            new_y = y + offset_y
            new_x = x + offset_x
            
            if new_segmentation[new_y, new_x] == 0:
                new_segmentation[new_y, new_x] = segmentation[y, x]
            else:
                # Handle overlapping pixels by choosing the class that occupies more space
                new_segmentation[new_y, new_x] = max(new_segmentation[new_y, new_x], segmentation[y, x], key=lambda cls: (segmentation == cls).sum())
    
    return new_segmentation

# Adjust the segmentation results
adjusted_data = {}
for key, value in data.items():
    if isinstance(value, dict) and 'predicted_segmentation' in value:
        adjusted_segmentation = adjust_coordinates(np.array(value['predicted_segmentation']), offset_x, offset_y)
        value['predicted_segmentation'] = adjusted_segmentation.tolist()
        adjusted_data[key] = value
    else:
        adjusted_data[key] = value

# Save the adjusted data back to a new pickle file
with open(new_pickle_file, 'wb') as file:
    pickle.dump(adjusted_data, file)

print(f"Adjusted pickle file saved to {new_pickle_file}")
