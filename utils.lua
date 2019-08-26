function dump(o, fulldump)
  if type(o) == 'table' then
    local s = '{'
    local cn = 1
    if #o ~= 0 then
      for _,v in ipairs(o) do
        if cn > 1 then s = s .. ',' end
        s = s .. dump(v, fulldump)
        cn = cn + 1
      end
    else
      if not fulldump and o["new"] ~= nil then --abridged print for table
        local tbl = {fullname = o.textname, id = o.id, x = o.x, y = o.y, dir = o.dir}
        for k,v in pairs(tbl) do
           if cn > 1 then s = s .. ',' end
          s = s .. tostring(k) .. ' = ' .. dump(v, fulldump)
          cn = cn + 1
        end
      else
        for k,v in pairs(o) do
          if cn > 1 then s = s .. ',' end
          s = s .. tostring(k) .. ' = ' .. dump(v, fulldump)
          cn = cn + 1
        end
      end
    end
    return s .. '}'
  elseif type(o) == 'string' then
    return '"' .. o .. '"'
  else
    return tostring(o)
  end
end