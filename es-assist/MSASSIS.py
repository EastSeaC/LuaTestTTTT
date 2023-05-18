import re

regex = r"^(\w*)\s*=\s*\d+\s*#\s*(.*)$"
coment_regex = r"\((\w*)(,<(\w+)>*)\)"
coment_regex1 = r"\<(\w+)\>"
coment_regex2 = r"\[\<(\w+)\>\]"
count = 0
count1 = 0


def getFunc(funcName: str, funcParam: list = []):
    return '{} =function({}) end,\n'.format(funcName, ','.join(funcParam))


f1 = open('es.lua', 'w')
start_str = 'game={ \n'
start_str += getFunc('addPrsnt', ['param'])
start_str += getFunc('addTrigger', [
    'strTemplateId',
    'numCheckTime',
    'numDelayTime',
    'numRearmTime',
    'funcConditionsCallback',
    'funcConsequencesCallback',
])
start_str += getFunc('removeTrigger', ['strTemplateId', 'intTriggerIndex'])
start_str += getFunc(
    'addItemTrigger',
    ['strItemID_or_intItemNo', 'numTriggerInterval', 'funcCallback'])
start_str += getFunc('agentsI', ['position_no', 'radius_fixed_point'])
start_str += getFunc('partiesI')
start_str += getFunc('propInstI', ['object_id', 'object_type'])
start_str += getFunc('playersI', ['skip_server'])

with open('header_operations.py', 'r') as f:
    t = f.readlines()
    for i in t:
        matchResult = re.match(regex, i)
        if matchResult:
            count += 1
            op_name = matchResult.group(1)
            op_coment = matchResult.group(2)

            index = op_coment.rfind('#')
            op_coment = op_coment[:index]
            matchResult = re.findall(coment_regex1, op_coment)
            temp = []
            for i in matchResult:
                if 'local' in i:
                    temp.append('local1')
                elif 'end' in i:
                    temp.append('end1')
                else:
                    temp.append(i)
            if matchResult:
                start_str += '{}=function({}) end,\n'.format(
                    op_name, ','.join(temp))
    print(count)

start_str += '}'
f1.write(start_str)