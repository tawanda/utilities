from PIL import Image
import os, sys

dir_path = "/Users/tawanda/Downloads/images"

def resize_im(path):
    if os.path.isfile(path):
        parent_dir = os.path.dirname(path)
        img_name = os.path.basename(path).split('.')[0]
        img_extension = os.path.basename(path).split('.')[1]

        if img_extension.upper() not in ['PNG', 'JPG', 'JPEG']:
            print('invalid extension >>', img_extension)
            return

        img = Image.open(path);

        width, height = img.size;
        asp_rat = width/height;

        # Enter new width (in pixels)
        new_width = 900;

        # Enter new height (in pixels)
        new_height = 900;

        new_asp_rat = new_width/new_height;


        if (new_asp_rat == asp_rat):
            img = img.resize((new_width, new_height), Image.ANTIALIAS);

        # adjusts the height to match the width
        # NOTE: if you want to adjust the width to the height, instead ->
        # uncomment the second line (new_width) and comment the first one (new_height)
        else:
            new_height = round(new_width / asp_rat);
            #new_width = round(new_height * asp_rat);
            img = img.resize((new_width, new_height), Image.ANTIALIAS);


        if img_extension.upper() == 'PNG':
            print('png detected')
            img.save(os.path.join(parent_dir, img_name + '_resized.png'), 'PNG', quality=90)
        else:
            img.save(os.path.join(parent_dir, img_name + '_resized.jpg'), 'JPEG', quality=90)
        print(f'resized {img_name}.{img_extension}')
        os.remove(path)

def resize_all(mydir):
    for subdir , _ , fileList in os.walk(mydir):
        for f in fileList:
            try:
                full_path = os.path.join(subdir,f)
                resize_im(full_path)
            except Exception as e:
                print('Unable to resize %s. Skipping.' % full_path)

if __name__ == '__main__':
    resize_all(dir_path)
