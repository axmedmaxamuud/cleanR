#' Survey Designer Data
#'
#' A dataset containing Survey Designer variables
#'
#'
#' @format A data frame with 100 rows and 122 variables:
#' \describe{
#'   \item{start}{survey start time}
#'   \item{end}{survey end time}
#'   \item{Area_Office}{Area_Office}
#'   \item{ADMIN1Name}{date of data collection}
#'   \item{ADMIN2Name}{ADMIN2Name}
#'   \item{EnumName}{EnumName}
#'   \item{RESPAge}{RESPAge}
#'   \item{RESPSex}{RESPSex}
#'   \item{RESPRelationHHH}{RESPRelationHHH}
#'   \item{HHHName}{HHHName}
#'   \item{HHHSex}{HHHSex}
#'   \item{HHHAge}{HHHAge}
#'   \item{HHHStatus}{HHHStatus}
#'   \item{HHSize01M}{HHSize01M}
#'   \item{HHSize01F}{HHSize01F}
#'   \item{HHSize24M}{HHSize24M}
#'   \item{HHSize24F}{HHSize24F}
#'   \item{HHSize511M}{HHSize511M}
#'   \item{HHSize511F}{HHSize511F}
#'   \item{HHSize1217M}{HHSize1217M}
#'   \item{HHSize1217F}{HHSize1217F}
#'   \item{HHSize1859M}{HHSize1859M}
#'   \item{HHSize1859F}{HHSize1859F}
#'   \item{HHSize60AboveM}{HHSize60AboveM}
#'   \item{HHSize60AboveF}{HHSize60AboveF}
#'   \item{FCSStap}{FCSStap}
#'   \item{FCSStapSRf}{FCSStapSRf}
#'   \item{HDDSStapCer}{HDDSStapCer}
#'   \item{HDDSStapRoot}{HDDSStapRoot}
#'   \item{FCSPulse}{FCSPulse}
#'   \item{HDDSPulse}{HDDSPulse}
#'   \item{FCSPulseSRf}{FCSPulseSRf}
#'   \item{FCSDairy}{FCSDairy}
#'   \item{HDDSDairy}{HDDSDairy}
#'   \item{FCSDairySRf}{FCSDairySRf}
#'   \item{FCSPr}{FCSPr}
#'   \item{FCSPrSRf}{FCSPrSRf}
#'   \item{FCSPrMeatF}{FCSPrMeatF}
#'   \item{HDDSPrMeatF}{HDDSPrMeatF}
#'   \item{FCSPrMeatO}{FCSPrMeatO}
#'   \item{HDDSPrMeatO}{HDDSPrMeatO}
#'   \item{FCSPrFish}{FCSPrFish}
#'   \item{HDDSPrFish}{HDDSPrFish}
#'   \item{FCSPrEgg}{FCSPrEgg}
#'   \item{HDDSPrEgg}{HDDSPrEgg}
#'   \item{FCSVeg}{FCSVeg}
#'   \item{FCSVegSRf}{FCSVegSRf}
#'   \item{FCSVegOrg}{FCSVegOrg}
#'   \item{HDDSVegOrg}{HDDSVegOrg}
#'   \item{FCSVegGre}{FCSVegGre}
#'   \item{HDDSVegGre}{HDDSVegGre}
#'   \item{FCSVegOth}{FCSVegOth}
#'   \item{HDDSVegOth}{HDDSVegOth}
#'   \item{FCSFruit}{FCSFruit}
#'   \item{FCSFruitSRf}{FCSFruitSRf}
#'   \item{FCSFruitOrg}{FCSFruitOrg}
#'   \item{HDDSFruitOrg}{HDDSFruitOrg}
#'   \item{FCSFruitOth}{FCSFruitOth}
#'   \item{HDDSFruitOth}{HDDSFruitOth}
#'   \item{FCSFat}{FCSFat}
#'   \item{HDDSFat}{HDDSFat}
#'   \item{FCSFatSRf}{FCSFatSRf}
#'   \item{FCSSugar}{FCSSugar}
#'   \item{HDDSSugar}{HDDSSugar}
#'   \item{FCSSugarSRf}{FCSSugarSRf}
#'   \item{FCSCond}{FCSCond}
#'   \item{HDDSCond}{HDDSCond}
#'   \item{FCSCondSRf}{FCSCondSRf}
#'   \item{LhCSIStress1}{LhCSIStress1}
#'   \item{LhCSIStress2}{LhCSIStress2}
#'   \item{LhCSIStress3}{LhCSIStress3}
#'   \item{LhCSIStress4}{LhCSIStress4}
#'   \item{LhCSICrisis1}{LhCSICrisis1}
#'   \item{LhCSICrisis2}{LhCSICrisis2}
#'   \item{LhCSICrisis3}{LhCSICrisis3}
#'   \item{LhCSIEmergency1}{LhCSIEmergency1}
#'   \item{LhCSIEmergency2}{LhCSIEmergency2}
#'   \item{LhCSIEmergency3}{LhCSIEmergency3}
#'   \item{rCSILessQlty}{rCSILessQlty}
#'   \item{rCSIBorrow}{rCSIBorrow}
#'   \item{rCSIMealSize}{rCSIMealSize}
#'   \item{rCSIMealAdult}{rCSIMealAdult}
#'   \item{rCSIMealNb}{rCSIMealNb}
#'   \item{HHhSNoFood_YN}{HHhSNoFood_YN}
#'   \item{HHhSNoFood_FR}{HHhSNoFood_FR}
#'   \item{HHhSBedHung_YN}{HHhSBedHung_YN}
#'   \item{HHhSBedHung_FR}{HHhSBedHung_FR}
#'   \item{HHhSNotEat_YN}{HHhSNotEat_YN}
#'   \item{HHhSNotEat_FR}{HHhSNotEat_FR}
#'   \item{HHAsstSecurity}{HHAsstSecurity}
#'   \item{HHAsstSecurityWhere}{HHAsstSecurityWhere}
#'   \item{HHAsstSecurityWhere/1}{HHAsstSecurityWhere/1}
#'   \item{HHAsstSecurityWhere/2}{HHAsstSecurityWhere/2}
#'   \item{HHAsstSecurityWhere/3}{HHAsstSecurityWhere/3}
#'   \item{HHAsstSecurityWhere/4}{HHAsstSecurityWhere/4}
#'   \item{HHAsstSecurityRisk}{HHAsstSecurityRisk}
#'   \item{HHAsstSecurityRisk/1}{HHAsstSecurityRisk/1}
#'   \item{HHAsstSecurityRisk/2}{HHAsstSecurityRisk/2}
#'   \item{HHAsstSecurityRisk/3}{HHAsstSecurityRisk/3}
#'   \item{HHAsstSecurityRisk/4}{HHAsstSecurityRisk/4}
#'   \item{HHAsstSecurityRisk/5}{HHAsstSecurityRisk/5}
#'   \item{HHAsstSecurityRisk/6}{HHAsstSecurityRisk/6}
#'   \item{HHAsstSecurityRisk/7}{HHAsstSecurityRisk/7}
#'   \item{HHAsstSecurityRisk/8}{HHAsstSecurityRisk/8}
#'   \item{HHAsstSecurityRisk/999}{HHAsstSecurityRisk/999}
#'   \item{HHAsstSecurityRisk_oth}{HHAsstSecurityRisk_oth}
#'   \item{HHAsstMeasuresYN}{HHAsstMeasuresYN}
#'   \item{HHAsstSafeLevel}{HHAsstSafeLevel}
#'   \item{HHAsstAccessSafer}{HHAsstAccessSafer}
#'   \item{HHAsstAccess}{HHAsstAccess}
#'   \item{HHAsstAccessWhat}{HHAsstAccessWhat}
#'   \item{HHAsstAccessWhat/1}{HHAsstAccessWhat/1}
#'   \item{HHAsstAccessWhat/2}{HHAsstAccessWhat/2}
#'   \item{HHAsstAccessWhat/3}{HHAsstAccessWhat/3}
#'   \item{HHAsstAccessWhat/4}{HHAsstAccessWhat/4}
#'   \item{HHAsstAccessWhat/5}{HHAsstAccessWhat/5}
#'   \item{HHAsstAccessWhat/6}{HHAsstAccessWhat/6}
#'   \item{HHAsstAccessWhat/7}{HHAsstAccessWhat/7}
#'   \item{HHAsstAccessWhat/999}{HHAsstAccessWhat/999}
#'   \item{HHAsstAccessWhat_oth}{HHAsstAccessWhat_oth}
#'   \item{HHAsstAccessAction}{HHAsstAccessAction}
#'   \item{HHAsstAccessComment}{HHAsstAccessComment}
#'   \item{uuid}{uuid}
#' }
#'
#' @source Survey Designer Data
#'
#' @examples
#' data(survey_data)
"survey_data"
