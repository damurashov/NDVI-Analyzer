function swap_images( pos1, pos2 )
%SWAP_IMAGES changes positions of given images

lpos = min(pos1,pos2);
rpos = max(pos1,pos2);
limg = get_image(lpos);
rimg = get_image(rpos);

remove_image(rpos);
insert_image_after(limg, rpos-1);
remove_image(lpos);
insert_image_after(rimg, lpos-1);

end

