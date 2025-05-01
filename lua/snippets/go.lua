local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

return {
  -- 主 Swagger 模板
  s("swag", fmt([[
    // @Summary {}
    // @Description {}
    // @Tags {}
    // @Accept json
    // @Produce json
    {}
    {}
    // @Router {} [{}]
  ]], {
    i(1, "Summary"),
    i(2, "Description"),
    i(3, "Tags"),
    i(4, "// @Param name in query true \"description\""),
    i(5, "// @Success 200 {object} Model \"ok\""),
    i(6, "/path"),
    i(7, "get"),
  })),

  -- 单个参数注释
  s("swagparam", fmt([[
// @Param {} {} {} {} "{}"
  ]], {
    i(1, "name"),
    i(2, "query"),
    i(3, "string"),
    i(4, "true"),
    i(5, "description"),
  })),

  -- 成功响应注释
  s("swagsuccess", fmt([[
// @Success {} {{object}} {} "{}"
  ]], {
    i(1, "200"),
    i(2, "ResponseModel"),
    i(3, "description"),
  })),

  -- 失败响应注释
  s("swagfailure", fmt([[
// @Failure {} {{object}} {} "{}"
  ]], {
    i(1, "400"),
    i(2, "ErrorModel"),
    i(3, "description"),
  })),
  -- 👇 if err != nil 模板
  s("iferr", fmt([[
    if {} != nil {{
        log.Errorf("err: %v", {})
        return {}, {}
    }}
  ]], {
    i(1, "err"),  -- 变量名
    rep(1),       -- log 输出用
    i(2, "nil"),  -- return 的第一个值
    rep(1),       -- return err
  })),
}
-- return {
--   s("swagger", fmt([[
--     // @Summary {}
--     // @Description {}
--     // @Tags {}
--     // @Accept json
--     // @Produce json
--     // @Param {} {} {} {} "{}"
--     // @Success 200 {{object}} {} "{}"
--     // @Failure 400 {{object}} {} "{}"
--     // @Router {} [{}]
--   ]], {
--     i(1, "Summary"),
--     i(2, "Description"),
--     i(3, "Tags"),
--     i(4, "ParamName"),
--     i(5, "ParamPosition"),
--     i(6, "ParamType"),
--     i(7, "true"),
--     i(8, "ParamDescription"),
--     i(9, "SuccessResponse"),
--     i(10, "SuccessDescription"),
--     i(11, "FailureResponse"),
--     i(12, "FailureDescription"),
--     i(13, "/path"),
--     i(14, "get"),
--   }))
-- }

-- s("swagger", fmt([[
--   // @Summary {}
--   // @Description {}
--   // @Tags {}
--   // @Accept json
--   // @Produce json
--   {}
--   {}
--   // @Router {} [{}]
-- ]], {
--   i(1, "Summary"),
--   i(2, "Description"),
--   i(3, "Tags"),
--   i(4, "// @Param name in query true \"description\""),
--   i(5, "// @Success 200 {object} Model \"ok\""),
--   i(6, "/path"),
--   i(7, "get"),
--
